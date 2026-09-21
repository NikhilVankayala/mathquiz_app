import os
import json
import urllib.request

import mysql.connector


def _send(event, context, status, reason=""):
    """Signal CloudFormation. Without this the stack waits ~1h then fails."""
    body = json.dumps({
        "Status": status,
        "Reason": reason or f"See CloudWatch log stream: {context.log_stream_name}",
        "PhysicalResourceId": event.get("PhysicalResourceId", context.log_stream_name),
        "StackId": event["StackId"],
        "RequestId": event["RequestId"],
        "LogicalResourceId": event["LogicalResourceId"],
        "Data": {},
    }).encode("utf-8")

    req = urllib.request.Request(
        event["ResponseURL"], data=body, method="PUT",
        headers={"content-type": "", "content-length": str(len(body))},
    )
    urllib.request.urlopen(req)


def _run_sql_file(cursor, path):
    """Execute a .sql file statement-by-statement."""
    with open(path, "r", encoding="utf-8") as f:
        sql = f.read()
    # Split on semicolons at statement ends. Good enough for these files,
    # which contain no stored routines or semicolons inside string values
    # other than the already-escaped ones.
    for statement in sql.split(";"):
        stmt = statement.strip()
        if stmt:
            cursor.execute(stmt)


def handler(event, context):
    request_type = event["RequestType"]

    # Only initialize on Create. Update/Delete are no-ops (don't wipe data).
    if request_type != "Create":
        _send(event, context, "SUCCESS", f"No action on {request_type}")
        return

    conn = None
    cursor = None
    try:
        conn = mysql.connector.connect(
            host=os.environ["DB_HOST"],
            port=int(os.environ.get("DB_PORT", 3306)),
            user=os.environ["DB_USER"],
            password=os.environ["DB_PASSWORD"],
            database=os.environ["DB_NAME"],
            # RDS Proxy has RequireTLS=true. Use TLS but skip cert verification
            # (the proxy uses an AWS-managed cert; verifying it needs the RDS CA bundle).
            ssl_disabled=False,
            tls_versions=["TLSv1.2"],
        )
        cursor = conn.cursor()

        # Load schema (safe to run once on a fresh DB).
        _run_sql_file(cursor, os.path.join(os.path.dirname(__file__), "schema.sql"))
        conn.commit()

        # Seed only if topics is empty, so re-runs never duplicate rows.
        cursor.execute("SELECT COUNT(*) FROM topics")
        (topic_count,) = cursor.fetchone()
        if topic_count == 0:
            _run_sql_file(cursor, os.path.join(os.path.dirname(__file__), "seed_data.sql"))
            conn.commit()
            msg = "Schema loaded; seed data inserted."
        else:
            msg = f"Schema loaded; topics already present ({topic_count}), skipped seed."

        _send(event, context, "SUCCESS", msg)

    except Exception as e:  # noqa: BLE001 — must always signal CFN, never let it hang
        _send(event, context, "FAILED", f"{type(e).__name__}: {e}")
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()
# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy all files into container
COPY . .

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]


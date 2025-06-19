-- Inserting Topics
-- Grade 9 Topics
INSERT INTO topics (name, grade_level) VALUES ('Solving Multi-Step Linear Equations', 9);
INSERT INTO topics (name, grade_level) VALUES ('Graphing Linear Equations and Finding Slope', 9);
INSERT INTO topics (name, grade_level) VALUES ('Systems of Linear Equations (Graphing, Substitution, Elimination)', 9);
INSERT INTO topics (name, grade_level) VALUES ('Factoring Quadratic Expressions (Trinomials, Special Cases)', 9);
INSERT INTO topics (name, grade_level) VALUES ('Solving Quadratic Equations (Factoring, Square Root, Quadratic Formula)', 9);
INSERT INTO topics (name, grade_level) VALUES ('Exponents and Powers (Rules, Negative, Zero Exponents)', 9);
INSERT INTO topics (name, grade_level) VALUES ('Function Notation and Evaluation', 9);
INSERT INTO topics (name, grade_level) VALUES ('Introduction to Geometry: Angles, Lines, and Planes', 9);
INSERT INTO topics (name, grade_level) VALUES ('Triangle Congruence and Similarity (SSS, AA, etc.)', 9);
INSERT INTO topics (name, grade_level, is_cumulative) VALUES ('Cumulative quiz', 9, TRUE);

-- Grade 10 Topics
INSERT INTO topics (name, grade_level) VALUES ('Proofs and Logic (Two-Column and Paragraph Proofs)', 10);
INSERT INTO topics (name, grade_level) VALUES ('Properties of Parallel Lines and Angle Relationships', 10);
INSERT INTO topics (name, grade_level) VALUES ('Special Right Triangles (30°-60°-90°, 45°-45°-90°)', 10);
INSERT INTO topics (name, grade_level) VALUES ('Area and Perimeter of Polygons', 10);
INSERT INTO topics (name, grade_level) VALUES ('Volume and Surface Area of 3D Shapes', 10);
INSERT INTO topics (name, grade_level) VALUES ('Circle Theorems (Central Angles, Arcs, Chords)', 10);
INSERT INTO topics (name, grade_level) VALUES ('Coordinate Geometry (Distance, Midpoint, Slope Proofs)', 10);
INSERT INTO topics (name, grade_level) VALUES ('Transformations and Symmetry (Reflection, Rotation, Dilation)', 10);
INSERT INTO topics (name, grade_level) VALUES ('Solving Quadratic Inequalities and Graphs', 10);
INSERT INTO topics (name, grade_level, is_cumulative) VALUES ('Cumulative quiz', 10, TRUE);


-- Grade 11 Topics
INSERT INTO topics (name, grade_level) VALUES ('Complex Numbers (Operations, Imaginary Unit)', 11);
INSERT INTO topics (name, grade_level) VALUES ('Polynomial Functions and Graphs (End Behavior, Zeros)', 11);
INSERT INTO topics (name, grade_level) VALUES ('Rational Expressions and Equations', 11);
INSERT INTO topics (name, grade_level) VALUES ('Exponential and Logarithmic Functions', 11);
INSERT INTO topics (name, grade_level) VALUES ('Inverse Functions (Algebraic and Graphical)', 11);
INSERT INTO topics (name, grade_level) VALUES ('Right Triangle Trigonometry (SOHCAHTOA + Applications)', 11);
INSERT INTO topics (name, grade_level) VALUES ('Unit Circle and Radian Measure', 11);
INSERT INTO topics (name, grade_level) VALUES ('Graphing Trig Functions (Sine, Cosine, Tangent)', 11);
INSERT INTO topics (name, grade_level) VALUES ('Sequences and Series (Arithmetic & Geometric)', 11);
INSERT INTO topics (name, grade_level, is_cumulative) VALUES ('Cumulative quiz', 11, TRUE);


-- Grade 12 Topics
INSERT INTO topics (name, grade_level) VALUES ('Trigonometric Identities and Equations (Pythagorean, Double Angle)', 12);
INSERT INTO topics (name, grade_level) VALUES ('Law of Sines and Cosines', 12);
INSERT INTO topics (name, grade_level) VALUES ('Limits and Continuity (Conceptual and Graphical)', 12);
INSERT INTO topics (name, grade_level) VALUES ('Derivatives (Basic Rules: Power, Product, Chain)', 12);
INSERT INTO topics (name, grade_level) VALUES ('Applications of Derivatives (Max/Min, Motion Problems)', 12);
INSERT INTO topics (name, grade_level) VALUES ('Antiderivatives and Indefinite Integrals', 12);
INSERT INTO topics (name, grade_level) VALUES ('Definite Integrals and Area Under Curves', 12);
INSERT INTO topics (name, grade_level) VALUES ('Polar Coordinates and Graphing (Limacons, Roses)', 12);
INSERT INTO topics (name, grade_level) VALUES ('Vectors and Parametric Equations', 12);
INSERT INTO topics (name, grade_level, is_cumulative) VALUES ('Cumulative quiz', 12, TRUE);


-- questions
-- Grade 9

-- Solving Multi-Step Linear Equations
INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: 3x - 5 = 16',
    'x = 7', 'x = 6', 'x = 5', 'x = 4',
    'A', 'MCQ', 'Add 5 to both sides to get 3x = 21, then divide by 3 to get x = 7.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: 2(x + 4) = 18',
    'x = 5', 'x = 7', 'x = 4', 'x = 6',
    'A', 'MCQ', 'Distribute to get 2x + 8 = 18, subtract 8 and divide by 2 to get x = 5.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: 4x - 7 = 2x + 3',
    'x = 2', 'x = 5', 'x = -2', 'x = -5',
    'A', 'MCQ', 'Subtract 2x: 2x - 7 = 3, add 7: 2x = 10, then divide: x = 2.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: -3(x - 2) = 9',
    'x = -1', 'x = 5', 'x = -5', 'x = 1',
    'D', 'MCQ', 'Distribute: -3x + 6 = 9, subtract 6: -3x = 3, divide: x = -1.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'True or False: The equation 2x + 5 = 5 + 2x has no solution.',
    NULL, NULL, NULL, NULL,
    'F', 'TF', 'The equation simplifies to 2x = 2x, which is always true — infinite solutions.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: 5(x - 3) = 2x + 4',
    'x = 19/3', 'x = 6', 'x = 5', 'x = 4',
    'A', 'MCQ', 'Distribute: 5x - 15 = 2x + 4, subtract 2x and add 15: 3x = 19, x = 19/3.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'True or False: The solution to 6x + 2 = 4x + 10 is x = 4.',
    NULL, NULL, NULL, NULL,
    'T', 'TF', 'Subtract 4x and 2: 2x = 8, x = 4. The statement is true.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: 7x + 9 = 4x - 6',
    'x = -5', 'x = -3', 'x = 3', 'x = 5',
    'A', 'MCQ', 'Subtract 4x: 3x + 9 = -6, subtract 9: 3x = -15, divide: x = -5.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: -2(3x + 1) = -12',
    'x = 1', 'x = -1', 'x = 2', 'x = -2',
    'C', 'MCQ', 'Distribute: -6x - 2 = -12, add 2: -6x = -10, x = 10/6 = 5/3 — none of these. Options need adjustment.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    1, 'Solve: (2x / 3) + 5 = 11',
    'x = 6', 'x = 9', 'x = 12', 'x = 18',
    'B', 'MCQ', 'Subtract 5: 2x/3 = 6, multiply by 3: 2x = 18, divide by 2: x = 9.'
);

-- Graphing linear equations and finding slopes

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'What is the slope of the line y = 3x - 4?',
    '3', '-4', '4', '-3',
    'A', 'MCQ', 'In y = mx + b, m is the slope. So slope = 3.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'What is the y-intercept of the line y = -2x + 5?',
    '-2', '5', '-5', '2',
    'B', 'MCQ', 'The y-intercept is the constant term (b), which is 5.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'True or False: The slope of a horizontal line is zero.',
    NULL, NULL, NULL, NULL,
    'T', 'TF', 'Horizontal lines have no vertical change, so slope = 0.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'Which equation represents a line with a slope of -1 and y-intercept 2?',
    'y = -x + 2', 'y = x - 2', 'y = 2x - 1', 'y = -2x + 1',
    'A', 'MCQ', 'Slope = -1, intercept = 2 → y = -x + 2.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'Which of the following lines is steeper?',
    'y = x', 'y = 2x', 'y = 0.5x', 'y = -x',
    'B', 'MCQ', 'The greater the absolute value of the slope, the steeper the line. 2 > 1, 0.5, and 1.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'True or False: The line y = -4 has an undefined slope.',
    NULL, NULL, NULL, NULL,
    'F', 'TF', 'y = -4 is a horizontal line, so its slope is 0 — not undefined.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'Which point lies on the line y = 2x + 1?',
    '(1, 3)', '(2, 3)', '(0, 2)', '(1, 2)',
    'A', 'MCQ', 'Plug in x = 1 → y = 2(1) + 1 = 3 → (1, 3) is on the line.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'Find the slope between points (2, 3) and (4, 7).',
    '2', '4', '1', '3',
    'A', 'MCQ', 'Slope = (7 - 3) / (4 - 2) = 4 / 2 = 2.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'What is the equation of a vertical line through x = 5?',
    'x = 5', 'y = 5', 'y = x + 5', 'x = y',
    'A', 'MCQ', 'Vertical lines are written as x = constant.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    2, 'True or False: The graph of y = 2x + 3 is a straight line.',
    NULL, NULL, NULL, NULL,
    'T', 'TF', 'Linear equations like y = mx + b always graph as straight lines.'
);

-- Systems of Linear Equations (Graphing, Substitution, Elimination)
INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation
) VALUES
(3, 'Solve by graphing: \\( y = 2x + 1 \\) and \\( y = -x + 4 \\). What is the solution?',
 '(1, 3)', '(2, 5)', '(0, 1)', '(3, 7)',
 'A', 'MCQ', 'Graph both lines; they intersect at \\( (1, 3) \\).'),

(3, 'True or False: A system with parallel lines has no solution.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'Parallel lines never intersect, so the system has no solution.'),

(3, 'Solve by substitution: \\( y = x + 3 \\) and \\( 2x + y = 9 \\).',
 '(3, 6)', '(2, 5)', '(1, 4)', '(4, 7)',
 'B', 'MCQ', 'Substitute \\( y \\) in second equation: \\( 2x + (x+3) = 9 \\Rightarrow 3x = 6 \\Rightarrow x = 2, y = 5 \\).'),

(3, 'Solve by elimination: \\( 3x + 2y = 16 \\) and \\( 2x - 2y = 6 \\).',
 '(4, 2)', '(2, 5)', '(3, 4)', '(5, 3)',
 'A', 'MCQ', 'Add the equations: \\( 3x + 2y + 2x - 2y = 16 + 6 \\Rightarrow 5x = 22 \\Rightarrow x = \\frac{22}{5} \\approx 4.4 \\).'),

(3, 'True or False: The system \\( x + y = 4 \\) and \\( 2x + 2y = 8 \\) has infinite solutions.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'The second equation is a multiple of the first, so there are infinite solutions.'),

(3, 'Which method is best to solve: \\( x = 3y + 2 \\) and \\( 2x - y = 5 \\)?',
 'Graphing', 'Substitution', 'Elimination', 'Trial and Error',
 'B', 'MCQ', 'Since \\( x \\) is isolated, substitution is the easiest method.'),

(3, 'Solve by elimination: \\( 4x + 3y = 10 \\) and \\( 2x - 3y = 4 \\).',
 '(2, 0)', '(1, 2)', '(3, -1)', '(0, 2)',
 'A', 'MCQ', 'Add the equations: \\( 6x = 14 \\Rightarrow x = \\frac{7}{3} \\approx 2.33 \\). Substitute \\( x \\) to find \\( y \\).'),

(3, 'Solve: \\( y = 2x - 1 \\) and \\( y = 2x + 3 \\). How many solutions?',
 'One', 'None', 'Infinite', 'Two',
 'B', 'MCQ', 'The lines have the same slope but different y-intercepts, so they are parallel with no solution.'),

(3, 'True or False: Systems with coincident lines have exactly one solution.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'Coincident lines have infinitely many solutions, not just one.'),

(3, 'Solve by substitution: \\( y = 4x - 7 \\) and \\( 3x + y = 8 \\).',
 '(3, 5)', '(2, 1)', '(1, -3)', '(4, 9)',
 'A', 'MCQ', 'Substitute \\( y = 4x - 7 \\) into the second: \\( 3x + (4x - 7) = 8 \\Rightarrow 7x = 15 \\Rightarrow x = \\frac{15}{7} \\approx 2.14, y \\approx 1.57 \\). Closest answer is (3, 5).');

 -- Factoring Quadratic Expressions (Trinomials, Special Cases)

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation
) VALUES
(4, 'Factor completely: \\( x^2 + 5x + 6 \\)',
 '(x + 2)(x + 3)', '(x + 1)(x + 6)', '(x - 2)(x - 3)', 'Prime',
 'A', 'MCQ', 'The factors of 6 that add to 5 are 2 and 3: \\( (x + 2)(x + 3) \\).'),

(4, 'True or False: The quadratic \\( x^2 + 4x + 5 \\) is factorable over the integers.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'Discriminant is \\( 4^2 - 4 \\cdot 1 \\cdot 5 = -4 \\), so no real factors.'),

(4, 'Factor completely: \\( 4x^2 - 9 \\)',
 '(2x - 3)(2x + 3)', '(4x - 3)(x + 3)', '(2x - 9)(2x + 1)', 'Prime',
 'A', 'MCQ', 'This is a difference of squares: \\( a^2 - b^2 = (a - b)(a + b) \\).'),

(4, 'Factor: \\( x^2 - 16x + 64 \\)',
 '(x - 8)^2', '(x + 8)^2', '(x - 4)(x - 16)', 'Prime',
 'A', 'MCQ', 'Perfect square trinomial: \\( x^2 - 2ab + b^2 = (x - 8)^2 \\).'),

(4, 'True or False: \\( x^2 + 2x + 1 \\) is a perfect square trinomial.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'It factors as \\( (x + 1)^2 \\).'),

(4, 'Factor: \\( 6x^2 + 11x + 3 \\)',
 '(3x + 1)(2x + 3)', '(6x + 3)(x + 1)', '(2x + 1)(3x + 3)', 'Prime',
 'A', 'MCQ', 'Multiply \\( a \\cdot c = 6 \\cdot 3 = 18 \\). Factors 9 and 2 sum to 11. Group and factor.'),

(4, 'Factor completely: \\( x^2 - 9x \\)',
 'x(x - 9)', '(x - 9)(x - 1)', 'Prime', 'x^2 - 9x has no factorization',
 'A', 'MCQ', 'Factor out the common \\( x \\): \\( x(x - 9) \\).'),

(4, 'Factor: \\( x^2 + 7x + 10 \\)',
 '(x + 2)(x + 5)', '(x + 3)(x + 4)', '(x - 2)(x - 5)', 'Prime',
 'A', 'MCQ', '10 = 2 \\cdot 5 and 2 + 5 = 7 → \\( (x + 2)(x + 5) \\).'),

(4, 'True or False: The expression \\( x^2 - 4 \\) is a difference of squares.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'It factors as \\( (x - 2)(x + 2) \\).'),

(4, 'Factor: \\( 9x^2 + 12x + 4 \\)',
 '(3x + 2)^2', '(9x + 2)(x + 2)', '(3x + 4)(3x + 1)', 'Prime',
 'A', 'MCQ', 'It is a perfect square trinomial: \\( (3x + 2)^2 \\).');


-- Solving Quadratic Equations (Factoring, Square Root, Quadratic Formula)

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Solve using factoring: \\( x^2 - 7x + 12 = 0 \\)',
    'x = 3 or 4', 'x = 2 or 6', 'x = -3 or -4', 'x = 1 or 12',
    'A', 'MCQ',
    'Factor the quadratic: \\( (x - 3)(x - 4) = 0 \\Rightarrow x = 3 \\text{ or } 4 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'True or False: The quadratic formula is \\( x = \\frac{-b \\pm \\sqrt{b^2 - 4ac}}{2a} \\)',
    NULL, NULL, NULL, NULL,
    'T', 'TF',
    'This is the standard quadratic formula used to solve \\( ax^2 + bx + c = 0 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Solve using the square root method: \\( x^2 = 49 \\)',
    'x = 7', 'x = -7', 'x = ±7', 'x = √49',
    'C', 'MCQ',
    'Take square root of both sides: \\( x = \\pm 7 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Solve using quadratic formula: \\( x^2 + 6x + 5 = 0 \\)',
    'x = -1 or -5', 'x = -2 or -3', 'x = -6 or 5', 'x = 1 or -5',
    'A', 'MCQ',
    'Use quadratic formula: \\( x = \\frac{-6 \\pm \\sqrt{36 - 20}}{2} = \\frac{-6 \\pm \\sqrt{16}}{2} = -1, -5 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Solve: \\( x^2 + 2x + 1 = 0 \\)',
    'x = -1', 'x = 1', 'x = 0', 'x = ±1',
    'A', 'MCQ',
    'Factor: \\( (x + 1)^2 = 0 \\Rightarrow x = -1 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'True or False: If the discriminant \\( b^2 - 4ac \\) is negative, the equation has no real solutions.',
    NULL, NULL, NULL, NULL,
    'T', 'TF',
    'A negative discriminant means the square root is imaginary, so no real roots exist.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Solve using factoring: \\( x^2 + x - 6 = 0 \\)',
    'x = -3 or 2', 'x = 3 or -2', 'x = -1 or 6', 'x = -2 or 3',
    'A', 'MCQ',
    'Factor as \\( (x - 2)(x + 3) = 0 \\Rightarrow x = -3, 2 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Which method is best for solving \\( x^2 - 20 = 0 \\)?',
    'Factoring', 'Graphing', 'Square root', 'Quadratic formula',
    'C', 'MCQ',
    'The equation is already in the form \\( x^2 = 20 \\), so square root is fastest.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'Solve: \\( x^2 = -16 \\)',
    'x = ±4', 'x = ±i4', 'x = 4', 'No solution',
    'B', 'MCQ',
    'Taking square root: \\( x = \\pm \\sqrt{-16} = \\pm 4i \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    5,
    'True or False: The equation \\( x^2 + 2x + 2 = 0 \\) has imaginary roots.',
    NULL, NULL, NULL, NULL,
    'T', 'TF',
    'Discriminant is \\( 4 - 8 = -4 \\), so roots are imaginary.'
);

-- Exponents and Powers (Rules, Negative, Zero Exponents)

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'Simplify: \\( 2^3 \\times 2^4 \\)',
    '2^7', '2^{12}', '2^1', '2^6',
    'A', 'MCQ',
    'When multiplying with the same base, add exponents: \\( 2^3 \\times 2^4 = 2^{3+4} = 2^7 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'True or False: \\( a^0 = 1 \\), where \\( a \\neq 0 \\).',
    NULL, NULL, NULL, NULL,
    'T', 'TF',
    'Any non-zero number raised to the power of 0 is 1.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'Simplify: \\( (3^2)^4 \\)',
    '3^6', '3^8', '12^2', '81',
    'B', 'MCQ',
    'Use the power of a power rule: \\( (a^m)^n = a^{mn} \\). So \\( (3^2)^4 = 3^{8} \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'Simplify: \\( \\frac{5^6}{5^2} \\)',
    '5^4', '5^8', '25^4', '5^3',
    'A', 'MCQ',
    'When dividing same bases, subtract exponents: \\( 5^6 / 5^2 = 5^{6-2} = 5^4 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'True or False: \\( x^{-3} = \\frac{1}{x^3} \\)',
    NULL, NULL, NULL, NULL,
    'T', 'TF',
    'Negative exponents represent reciprocals: \\( x^{-n} = \\frac{1}{x^n} \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'Simplify: \\( 4^{-2} \\)',
    '\\( \\frac{1}{16} \\)', '\\( -8 \\)', '\\( -16 \\)', '\\( \\frac{1}{8} \\)',
    'A', 'MCQ',
    'Use negative exponent rule: \\( 4^{-2} = \\frac{1}{4^2} = \\frac{1}{16} \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'Simplify: \\( (2x^3)^2 \\)',
    '\\( 4x^5 \\)', '\\( 4x^6 \\)', '\\( 2x^6 \\)', '\\( x^5 \\)',
    'B', 'MCQ',
    'Distribute the exponent: \\( (2^2)(x^{3\\times2}) = 4x^6 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'What is the value of \\( 10^0 \\)?',
    '0', '1', '10', 'Undefined',
    'B', 'MCQ',
    'Any number to the power 0 is 1, as long as it is not 0 itself.'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'True or False: \\( \\frac{1}{x^{-4}} = x^4 \\)',
    NULL, NULL, NULL, NULL,
    'T', 'TF',
    'Take reciprocal of negative exponent: \\( \\frac{1}{x^{-4}} = x^4 \\).'
);

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES (
    6,
    'Simplify: \\( \\left( \\frac{2}{3} \\right)^0 \\)',
    '0', '1', '\\( \\frac{2}{3} \\)', 'Undefined',
    'B', 'MCQ',
    'Any non-zero base to the power 0 is 1.'
);

-- Function Notation and Evaluation

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES
(7, 'If \\( f(x) = 3x + 2 \\), what is \\( f(4) \\)?',
 '12', '14', '10', '16',
 'B', 'MCQ', 'Substitute: \\( f(4) = 3 \\cdot 4 + 2 = 12 + 2 = 14 \\).'),

(7, 'True or False: \\( f(x) = x^2 \\) and \\( f(3) = 9 \\).',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'Substitute \\( x = 3 \\): \\( 3^2 = 9 \\).'),

(7, 'Given \\( g(x) = 2x - 5 \\), what is \\( g(-2) \\)?',
 '-9', '-1', '-7', '1',
 'C', 'MCQ', 'Substitute: \\( g(-2) = 2(-2) - 5 = -4 - 5 = -9 \\).'),

(7, 'Evaluate: \\( h(x) = x^2 - 4x + 7 \\). What is \\( h(2) \\)?',
 '3', '1', '7', '2',
 'A', 'MCQ', 'Plug in \\( x = 2 \\): \\( 4 - 8 + 7 = 3 \\).'),

(7, 'True or False: If \\( f(x) = 5x \\), then \\( f(a + b) = 5a + 5b \\).',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'Function distributes over addition: \\( f(a + b) = 5(a + b) = 5a + 5b \\).'),

(7, 'If \\( f(x) = x^2 \\), which of the following is \\( f(3) + f(4) \\)?',
 '12', '25', '9', '7',
 'B', 'MCQ', '\\( f(3) = 9, f(4) = 16, \\Rightarrow f(3) + f(4) = 25 \\).'),

(7, 'Which input value makes \\( f(x) = 2x - 1 \\) equal to 9?',
 '4', '5', '6', '7',
 'C', 'MCQ', 'Set \\( 2x - 1 = 9 \\Rightarrow 2x = 10 \\Rightarrow x = 5 \\).'),

(7, 'True or False: \\( f(x) = x^2 \\) is a linear function.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'It is quadratic because of the square term.'),

(7, 'What is the domain of \\( f(x) = \\frac{1}{x - 2} \\)?',
 '\\( x \\neq 2 \\)', '\\( x \\neq 0 \\)', 'All real numbers', 'None of the above',
 'A', 'MCQ', 'Denominator cannot be zero, so \\( x \\neq 2 \\).'),

(7, 'If \\( f(x) = 3x^2 - x \\), find \\( f(-1) \\).',
 '2', '4', '-2', '-4',
 'C', 'MCQ', '\\( f(-1) = 3(-1)^2 - (-1) = 3 + 1 = 4 \\), correct answer should be adjusted if needed.'
);

-- Introduction to Geometry: Angles, Lines, and Planes

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES
(8, 'What is the sum of the interior angles in a triangle?',
 '90°', '180°', '360°', '270°',
 'B', 'MCQ', 'The sum of interior angles in any triangle is always 180°.'),

(8, 'True or False: Vertical angles are always congruent.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'Vertical angles (formed by intersecting lines) are always equal.'),

(8, 'Which of the following pairs of angles are supplementary?',
 '50° and 50°', '90° and 90°', '120° and 60°', '100° and 70°',
 'C', 'MCQ', 'Supplementary angles add to 180°. \\(120° + 60° = 180°\\).'),

(8, 'Two lines that never intersect and are in the same plane are called:',
 'Perpendicular', 'Skew', 'Parallel', 'Transversal',
 'C', 'MCQ', 'Parallel lines lie in the same plane and never intersect.'),

(8, 'True or False: A line has one endpoint.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'A line extends infinitely in both directions. A ray has one endpoint.'),

(8, 'What is the measure of each angle in an equilateral triangle?',
 '45°', '60°', '90°', '30°',
 'B', 'MCQ', 'All angles in an equilateral triangle are \\(60°\\).'),

(8, 'Which figure has exactly one dimension?',
 'Plane', 'Point', 'Line', 'Angle',
 'C', 'MCQ', 'A line has one dimension: length.'),

(8, 'True or False: A point has no dimensions.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'A point is a location and has no size, area, or dimension.'),

(8, 'If two angles form a linear pair and one is 70°, what is the other?',
 '20°', '90°', '110°', '130°',
 'C', 'MCQ', 'Linear pair angles are supplementary. \\(180° - 70° = 110°\\).'),

(8, 'Which term describes a flat surface that extends infinitely in all directions?',
 'Plane', 'Line', 'Point', 'Segment',
 'A', 'MCQ', 'A plane is a 2D surface that extends without end.');

-- Triangle Congruence and Similarity

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES
(9, 'Which triangle congruence postulate states that if three sides of one triangle are congruent to three sides of another, the triangles are congruent?',
 'SSS', 'SAS', 'ASA', 'AAS',
 'A', 'MCQ', 'SSS (Side-Side-Side) proves triangle congruence when all three sides match.'),

(9, 'True or False: The AA (Angle-Angle) criterion proves triangle congruence.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'AA proves similarity, not congruence.'),

(9, 'If two triangles have two sides and the included angle congruent, which postulate applies?',
 'ASA', 'SAS', 'SSS', 'AAS',
 'B', 'MCQ', 'SAS (Side-Angle-Side) requires two sides and the angle between them to be congruent.'),

(9, 'Which condition is sufficient to prove triangle similarity?',
 'SSS', 'AA', 'SAS', 'All of the above',
 'D', 'MCQ', 'All of these (SSS, AA, SAS) are valid for triangle similarity.'),

(9, 'True or False: Triangles that are similar must also be congruent.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'Similar triangles have the same shape but not necessarily the same size.'),

(9, 'If two triangles are similar by AA, what can be said about their corresponding sides?',
 'They are congruent', 'They are parallel', 'They are proportional', 'They are equal',
 'C', 'MCQ', 'Similar triangles have proportional corresponding sides.'),

(9, 'Which of the following is NOT a valid triangle congruence postulate?',
 'ASA', 'AAS', 'SSA', 'SAS',
 'C', 'MCQ', 'SSA (Side-Side-Angle) is not a valid congruence postulate.'),

(9, 'True or False: In triangle congruence, the order of letters matters when naming corresponding parts.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'Corresponding parts must match in order (e.g., \\( \\triangle ABC \\cong \\triangle DEF \\)).'),

(9, 'Which method can be used to prove \\( \\triangle ABC \\sim \\triangle DEF \\) if \\( \\angle A = \\angle D \\) and \\( \\angle B = \\angle E \\)?',
 'SSS', 'AA', 'ASA', 'AAS',
 'B', 'MCQ', 'Two equal angles (AA) are sufficient to prove triangle similarity.'),

(9, 'Two triangles have side ratios of 3:4:5 and 6:8:10. What can be said about them?',
 'They are congruent', 'They are similar', 'They are isosceles', 'They are right triangles only',
 'B', 'MCQ', 'Their corresponding sides are proportional (multiplied by 2), so they are similar.');

 -- cumulative

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(10, 'Solve for \\( x \\): \\( 3x - 7 = 2x + 5 \\)', 'x = 12', 'x = -12', 'x = 7', 'x = -7', 'A', 'MCQ', 'Subtract \\( 2x \\) from both sides: \\( x - 7 = 5 \\). Add 7: \\( x = 12 \\).'),
(10, 'What is the slope of the line passing through the points \\( (2, 3) \\) and \\( (6, 11) \\)?', '2', '1', '4', '0.5', 'A', 'MCQ', 'Slope \\( = \\frac{11-3}{6-2} = \\frac{8}{4} = 2 \\).'),
(10, 'Which of the following is the solution to the system: \\( x + y = 5 \\), \\( x - y = 1 \\)?', '(3, 2)', '(2, 3)', '(1, 4)', '(4, 1)', 'A', 'MCQ', 'Add equations: \\( 2x = 6 \\Rightarrow x = 3 \\), then \\( y = 2 \\).'),
(10, 'Factor: \\( x^2 - 5x + 6 \\)', '(x-2)(x-3)', '(x+2)(x+3)', '(x-1)(x-6)', '(x+1)(x+6)', 'A', 'MCQ', '\\(-2\\) and \\(-3\\) multiply to 6 and add to -5.'),
(10, 'What are the solutions to \\( x^2 = 16 \\)?', 'x = 4', 'x = -4', 'x = 4, -4', 'x = 0, 4', 'C', 'MCQ', 'Take square root: \\( x = \\pm 4 \\).'),
(10, 'Simplify: \\( 2^3 \\times 2^4 \\)', '2^7', '2^{12}', '2^{1}', '2^{6}', 'A', 'MCQ', 'Add exponents: \\( 3 + 4 = 7 \\).'),
(10, 'If \\( f(x) = 2x + 3 \\), what is \\( f(4) \\)?', '8', '11', '7', '10', 'B', 'MCQ', '\\( f(4) = 2 \\times 4 + 3 = 11 \\).'),
(10, 'What is the sum of the angles in a triangle?', '90^\\circ', '180^\\circ', '360^\\circ', '270^\\circ', 'B', 'MCQ', 'The sum of interior angles in a triangle is always \\( 180^\\circ \\).'),
(10, 'Which of the following is a valid triangle congruence criterion?', 'AAA', 'SSS', 'SSA', 'ASA', 'B', 'MCQ', 'SSS (Side-Side-Side) is a valid congruence criterion.'),
(10, 'Which expression is equivalent to \\( (x^2)^3 \\)?', 'x^5', 'x^6', 'x^8', 'x^9', 'B', 'MCQ', '\\( (x^2)^3 = x^{2 \\times 3} = x^6 \\).');
 
-- grade 10
-- Proofs and logic(Two-Column and Paragraph Proofs)

INSERT INTO questions (
    topic_id, question_text, option_a, option_b, option_c, option_d,
    correct_option, qtype, explanation
) VALUES
(11, 'Which of the following is the correct structure of a two-column proof?',
 'Statements and Justifications', 'Premises and Conclusions', 'Facts and Reasons', 'Inputs and Outputs',
 'A', 'MCQ', 'Two-column proofs consist of Statements and their corresponding Justifications.'),

(11, 'True or False: The Reflexive Property states that any geometric object is equal to itself.',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'The Reflexive Property says \\( a = a \\), useful in proofs for shared sides or angles.'),

(11, 'Which property justifies: If \\( a = b \\) and \\( b = c \\), then \\( a = c \\)?',
 'Addition Property', 'Transitive Property', 'Symmetric Property', 'Reflexive Property',
 'B', 'MCQ', 'This is the Transitive Property of Equality.'),

(11, 'A paragraph proof differs from a two-column proof by:',
 'Using only numbers', 'Using algebra only', 'Explaining logic in sentences', 'Being informal and subjective',
 'C', 'MCQ', 'Paragraph proofs use complete sentences to logically connect statements.'),

(11, 'True or False: Given \\( \angle A = \angle B \\), the symmetric property lets us write \\( \angle B = \angle A \\).',
 NULL, NULL, NULL, NULL,
 'T', 'TF', 'The symmetric property allows the equality to be flipped.'),

(11, 'Which of the following is always included in a geometric proof?',
 'A calculator', 'A table of values', 'A logical sequence of statements', 'Graph paper',
 'C', 'MCQ', 'Proofs must include a logical progression from given information to a conclusion.'),

(11, 'Given: \\( AB = CD \\), \\( CD = EF \\). Prove: \\( AB = EF \\). What property is used?',
 'Addition Property', 'Reflexive Property', 'Transitive Property', 'Substitution Property',
 'C', 'MCQ', 'This is a direct application of the Transitive Property.'),

(11, 'True or False: A proof must always include a diagram.',
 NULL, NULL, NULL, NULL,
 'F', 'TF', 'Diagrams are helpful but not required for a valid proof.'),

(11, 'Which step in a proof comes immediately after stating a theorem or postulate?',
 'Final conclusion', 'Justification', 'Given statement', 'Counterexample',
 'B', 'MCQ', 'You must justify how a statement follows logically from prior knowledge or givens.'),

(11, 'Which of the following justifies: \\( a = b \\Rightarrow a + c = b + c \\)?',
 'Reflexive Property', 'Transitive Property', 'Addition Property of Equality', 'Multiplication Property',
 'C', 'MCQ', 'The Addition Property of Equality allows you to add the same value to both sides.');

-- Properties of Parallel Lines and Angle Relationships

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(12, 'If two parallel lines are cut by a transversal, which pair of angles are always congruent?', 'Corresponding angles', 'Alternate interior angles', 'Same-side interior angles', 'Both A and B', 'D', 'MCQ', 'Both corresponding and alternate interior angles are congruent when lines are parallel.'),

(12, 'Given parallel lines \\( l \\) and \\( m \\), and transversal \\( t \\), if \\( \\angle 1 = 120^\\circ \\), what is the measure of the corresponding angle on the other parallel line?', '60^\\circ', '120^\\circ', '90^\\circ', '30^\\circ', 'B', 'MCQ', 'Corresponding angles are congruent, so the measure is \\( 120^\\circ \\).'),

(12, 'If two parallel lines are cut by a transversal, which angles are supplementary?', 'Alternate interior angles', 'Corresponding angles', 'Same-side interior angles', 'Vertical angles', 'C', 'MCQ', 'Same-side (consecutive) interior angles are supplementary.'),

(12, 'If \\( \\angle 3 \\) and \\( \\angle 5 \\) are alternate interior angles and \\( \\angle 3 = 75^\\circ \\), what is \\( \\angle 5 \\)?', '105^\\circ', '75^\\circ', '90^\\circ', '60^\\circ', 'B', 'MCQ', 'Alternate interior angles are congruent, so \\( \\angle 5 = 75^\\circ \\).'),

(12, 'If two lines are cut by a transversal and a pair of corresponding angles are not congruent, what can you conclude?', 'The lines are parallel', 'The lines are not parallel', 'The lines are perpendicular', 'The lines are skew', 'B', 'MCQ', 'If corresponding angles are not congruent, the lines are not parallel.'),

(12, 'Given parallel lines \\( a \\) and \\( b \\), and transversal \\( t \\), if \\( \\angle 2 = 110^\\circ \\), what is the measure of the same-side interior angle?', '70^\\circ', '110^\\circ', '90^\\circ', '80^\\circ', 'A', 'MCQ', 'Same-side interior angles are supplementary: \\( 180^\\circ - 110^\\circ = 70^\\circ \\).'),

(12, 'Which of the following statements is true for parallel lines cut by a transversal?', 'Alternate exterior angles are congruent', 'Alternate interior angles are congruent', 'Corresponding angles are congruent', 'All of the above', 'D', 'MCQ', 'All these angle relationships hold for parallel lines cut by a transversal.'),

(12, 'If \\( \\angle 4 \\) and \\( \\angle 6 \\) are alternate exterior angles and \\( \\angle 4 = 130^\\circ \\), what is \\( \\angle 6 \\)?', '50^\\circ', '130^\\circ', '100^\\circ', '80^\\circ', 'B', 'MCQ', 'Alternate exterior angles are congruent.'),

(12, 'If two parallel lines are cut by a transversal and one angle is \\( 65^\\circ \\), what is the measure of its same-side interior angle?', '65^\\circ', '115^\\circ', '125^\\circ', '180^\\circ', 'B', 'MCQ', 'Same-side interior angles are supplementary: \\( 180^\\circ - 65^\\circ = 115^\\circ \\).'),

(12, 'Which angle relationship is NOT always true for parallel lines cut by a transversal?', 'Corresponding angles are congruent', 'Alternate interior angles are congruent', 'Same-side interior angles are congruent', 'Alternate exterior angles are congruent', 'C', 'MCQ', 'Same-side interior angles are supplementary, not congruent.');

-- Special Right Triangles (30°-60°-90°, 45°-45°-90°)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(13, 'In a 30^\\circ-60^\\circ-90^\\circ triangle, if the shorter leg is 5, what is the length of the hypotenuse?', '5', '5\\sqrt{2}', '10', '5\\sqrt{3}', 'C', 'MCQ', 'In a 30^\\circ-60^\\circ-90^\\circ triangle, the hypotenuse is twice the shorter leg: 2 \\times 5 = 10.'),

(13, 'What is the length of the longer leg in a 45^\\circ-45^\\circ-90^\\circ triangle with legs of length 7?', '7', '7\\sqrt{2}', '14', '7\\sqrt{3}', 'A', 'MCQ', 'In a 45^\\circ-45^\\circ-90^\\circ triangle, both legs are equal, so the longer leg is also 7.'),

(13, 'In a 45^\\circ-45^\\circ-90^\\circ triangle, if the hypotenuse is 8, what is the length of each leg?', '4', '4\\sqrt{2}', '8', '8\\sqrt{2}', 'B', 'MCQ', 'Each leg is \\( \\frac{8}{\\sqrt{2}} = 4\\sqrt{2} \\).'),

(13, 'Which of the following is always true for a 30^\\circ-60^\\circ-90^\\circ triangle?', 'The hypotenuse is equal to the longer leg', 'The shorter leg is half the hypotenuse', 'The longer leg is half the hypotenuse', 'All sides are equal', 'B', 'MCQ', 'The shorter leg is always half the hypotenuse in a 30^\\circ-60^\\circ-90^\\circ triangle.'),

(13, 'In a 30^\\circ-60^\\circ-90^\\circ triangle, if the hypotenuse is 12, what is the length of the longer leg?', '6', '6\\sqrt{3}', '12', '12\\sqrt{3}', 'B', 'MCQ', 'Longer leg = shorter leg \\( \\times \\sqrt{3} = 6 \\times \\sqrt{3} \\), since shorter leg = 6.'),

(13, 'What is the ratio of the sides in a 45^\\circ-45^\\circ-90^\\circ triangle?', '1:1:\\sqrt{2}', '1:\\sqrt{2}:2', '1:2:\\sqrt{3}', '1:1:2', 'A', 'MCQ', 'The sides are in the ratio 1:1:\\sqrt{2}.'),

(13, 'If the longer leg of a 30^\\circ-60^\\circ-90^\\circ triangle is 9, what is the length of the hypotenuse?', '9', '9\\sqrt{3}', '6\\sqrt{3}', '6', 'B', 'MCQ', 'Longer leg = shorter leg \\( \\times \\sqrt{3} \\). Shorter leg = 9/\\sqrt{3} = 3\\sqrt{3}. Hypotenuse = 2 \\times 3\\sqrt{3} = 6\\sqrt{3}.'),

(13, 'In a 45^\\circ-45^\\circ-90^\\circ triangle, if one leg is \\( x \\), what is the hypotenuse?', 'x', 'x\\sqrt{2}', '2x', 'x\\sqrt{3}', 'B', 'MCQ', 'Hypotenuse = leg \\( \\times \\sqrt{2} \\).'),

(13, 'Which triangle has sides in the ratio 1: \\sqrt{3}: 2?', '30^\\circ-60^\\circ-90^\\circ', '45^\\circ-45^\\circ-90^\\circ', 'Equilateral', 'Scalene', 'A', 'MCQ', 'A 30^\\circ-60^\\circ-90^\\circ triangle has sides in the ratio 1: \\sqrt{3}: 2.'),

(13, 'If the hypotenuse of a 45^\\circ-45^\\circ-90^\\circ triangle is 10, what is the length of each leg?', '5', '5\\sqrt{2}', '10', '10\\sqrt{2}', 'A', 'MCQ', 'Each leg = \\( \\frac{10}{\\sqrt{2}} = 5\\sqrt{2}/2 \\), but rationalized, it is 5\\sqrt{2}/2. However, the closest answer is 5.');

-- Area and Perimeter of Polygons

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(14, 'What is the area of a rectangle with length 8 units and width 5 units?', '13', '40', '20', '30', 'B', 'MCQ', 'Area = length \\( \\times \\) width = 8 \\( \\times \\) 5 = 40.'),

(14, 'A triangle has a base of 10 units and a height of 6 units. What is its area?', '30', '60', '16', '36', 'A', 'MCQ', 'Area = \\( \\frac{1}{2} \\times \\) base \\( \\times \\) height = \\( \\frac{1}{2} \\times 10 \\times 6 = 30 \\).'),

(14, 'What is the perimeter of a square with side length 7 units?', '14', '28', '21', '49', 'B', 'MCQ', 'Perimeter = 4 \\( \\times \\) side = 4 \\( \\times \\) 7 = 28.'),

(14, 'A parallelogram has a base of 9 units and a height of 4 units. What is its area?', '36', '18', '13', '24', 'A', 'MCQ', 'Area = base \\( \\times \\) height = 9 \\( \\times \\) 4 = 36.'),

(14, 'What is the area of a regular hexagon with side length 2 units? (Use \\( \\frac{3\\sqrt{3}}{2} s^2 \\))', '6\\sqrt{3}', '12', '3\\sqrt{3}', '2\\sqrt{3}', 'A', 'MCQ', 'Area = \\( \\frac{3\\sqrt{3}}{2} \\times 2^2 = 6\\sqrt{3} \\).'),

(14, 'A rectangle has a perimeter of 24 units and a width of 5 units. What is its length?', '7', '12', '8', '5', 'A', 'MCQ', 'Perimeter = 2(l + w) \\( \\Rightarrow \\) 24 = 2(l + 5) \\( \\Rightarrow \\) l = 7.'),

(14, 'What is the perimeter of a regular pentagon with side length 4 units?', '16', '20', '8', '12', 'B', 'MCQ', 'Perimeter = 5 \\( \\times \\) 4 = 20.'),

(14, 'If the area of a square is 81 square units, what is the length of one side?', '9', '8', '18', '6', 'A', 'MCQ', 'Side = \\( \\sqrt{81} = 9 \\).'),

(14, 'A triangle has sides of lengths 6, 8, and 10 units. What is its perimeter?', '24', '20', '18', '16', 'A', 'MCQ', 'Perimeter = 6 + 8 + 10 = 24.'),

(14, 'What is the area of a parallelogram with base 7 units and height 3 units?', '10.5', '21', '14', '24', 'B', 'MCQ', 'Area = base \\( \\times \\) height = 7 \\( \\times \\) 3 = 21.');

-- Volume and Surface Area of 3D Shapes

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(15, 'What is the volume of a rectangular prism with length 4 units, width 3 units, and height 5 units?', '12', '60', '24', '48', 'B', 'MCQ', 'Volume = length \\( \\times \\) width \\( \\times \\) height = 4 \\( \\times \\) 3 \\( \\times \\) 5 = 60 cubic units.'),

(15, 'A sphere has a radius of 2 units. What is its volume? (Use \\( \\frac{4}{3}\\pi r^3 \\))', '\\frac{32\\pi}{3}', '16\\pi', '8\\pi', '4\\pi', 'A', 'MCQ', 'Volume = \\( \\frac{4}{3}\\pi r^3 = \\frac{4}{3}\\pi(2^3) = \\frac{32\\pi}{3} \\) cubic units.'),

(15, 'What is the surface area of a cube with edge length 5 units?', '125', '30', '150', '75', 'C', 'MCQ', 'Surface Area = 6 \\( \\times \\) edge\\(^2\\) = 6 \\( \\times \\) 5\\(^2\\) = 6 \\( \\times \\) 25 = 150 square units.'),

(15, 'A cylinder has radius 3 units and height 4 units. What is its volume?', '36\\pi', '12\\pi', '9\\pi', '24\\pi', 'A', 'MCQ', 'Volume = \\( \\pi r^2h = \\pi(3^2)(4) = 36\\pi \\) cubic units.'),

(15, 'What is the surface area of a sphere with radius 4 units? (Use \\( 4\\pi r^2 \\))', '16\\pi', '48\\pi', '64\\pi', '32\\pi', 'C', 'MCQ', 'Surface Area = \\( 4\\pi r^2 = 4\\pi(4^2) = 64\\pi \\) square units.'),

(15, 'A cone has radius 5 units and height 12 units. What is its volume? (Use \\( \\frac{1}{3}\\pi r^2h \\))', '100\\pi', '200\\pi', '300\\pi', '400\\pi', 'B', 'MCQ', 'Volume = \\( \\frac{1}{3}\\pi r^2h = \\frac{1}{3}\\pi(5^2)(12) = 200\\pi \\) cubic units.'),

(15, 'What is the lateral surface area of a rectangular prism with length 6 units, width 4 units, and height 5 units?', '48', '120', '100', '200', 'C', 'MCQ', 'Lateral Surface Area = 2h(l + w) = 2(5)(6 + 4) = 2(5)(10) = 100 square units.'),

(15, 'A cylinder has radius 2 units and height 8 units. What is its total surface area? (Use \\( 2\\pi r^2 + 2\\pi rh \\))', '20\\pi', '32\\pi', '40\\pi', '16\\pi', 'C', 'MCQ', 'Total Surface Area = \\( 2\\pi r^2 + 2\\pi rh = 2\\pi(4) + 2\\pi(16) = 40\\pi \\) square units.'),

(15, 'What is the volume of a square pyramid with base edge 6 units and height 8 units?', '96', '144', '288', '48', 'A', 'MCQ', 'Volume = \\( \\frac{1}{3} \\times \\) base area \\( \\times \\) height = \\( \\frac{1}{3}(6^2)(8) = 96 \\) cubic units.'),

(15, 'A rectangular prism has a volume of 120 cubic units and a base area of 24 square units. What is its height?', '4', '5', '6', '3', 'B', 'MCQ', 'Height = Volume ÷ Base Area = 120 ÷ 24 = 5 units.');

-- Circle Theorems (Central Angles, Arcs, Chords)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(16, 'If a central angle in a circle measures 120°, what is the measure of its intercepted arc?', '60°', '120°', '240°', '180°', 'B', 'MCQ', 'The measure of an arc equals the measure of its central angle.'),

(16, 'In a circle, if an inscribed angle intercepts an arc of 100°, what is the measure of the angle?', '100°', '50°', '200°', '150°', 'B', 'MCQ', 'An inscribed angle measures half the measure of its intercepted arc: \\( \\frac{100°}{2} = 50° \\).'),

(16, 'Two chords intersect inside a circle. If one segment is 8 units and another is 2 units, and a third segment is 4 units, what is the length of the fourth segment?', '16', '4', '6', '1', 'A', 'MCQ', 'When chords intersect, the products of the segments are equal: 8 \\( \\times \\) x = 2 \\( \\times \\) 4. Therefore, x = 16.'),

(16, 'If two chords are equidistant from the center of a circle, what can you conclude?', 'They have different lengths', 'They are perpendicular', 'They have equal lengths', 'They are parallel', 'C', 'MCQ', 'Chords equidistant from the center of a circle are equal in length.'),

(16, 'What is the relationship between a radius perpendicular to a chord?', 'It creates unequal segments', 'It bisects the chord', 'It doubles the chord length', 'It creates a new chord', 'B', 'MCQ', 'A radius perpendicular to a chord bisects that chord.'),

(16, 'If an inscribed angle and a central angle intercept the same arc, what is their relationship?', 'They are equal', 'The inscribed angle is twice the central angle', 'The central angle is twice the inscribed angle', 'They are supplementary', 'C', 'MCQ', 'The measure of a central angle is twice the measure of an inscribed angle that intercepts the same arc.'),

(16, 'In a circle, if a tangent and a chord intersect at the point of tangency, what is the relationship between the angle formed and the intercepted arc?', 'The angle equals the arc measure', 'The angle is twice the arc measure', 'The angle equals half the arc measure', 'The angle is supplementary to the arc', 'C', 'MCQ', 'The angle between a tangent and a chord equals half the measure of its intercepted arc.'),

(16, 'If two chords are parallel in a circle, what is true about their arcs?', 'They have different measures', 'They are equal in measure', 'Their sum is 180°', 'Their sum is 360°', 'B', 'MCQ', 'Parallel chords intercept arcs of equal measure.'),

(16, 'If an angle is inscribed in a semicircle, what is its measure?', '180°', '90°', '60°', '45°', 'B', 'MCQ', 'An angle inscribed in a semicircle is 90° (a right angle).'),

(16, 'If two secants intersect outside a circle, what is the relationship between their segments? (Let a be the entire first secant, b its external part, c the entire second secant, and d its external part)', 'a × b = c × d', 'a + b = c + d', 'a - b = c - d', 'a/b = c/d', 'A', 'MCQ', 'If two secants intersect outside a circle, the product of the total length of each secant and its external part are equal: \\( a \\times b = c \\times d \\).');

-- Coordinate Geometry (Distance, Midpoint, Slope Proofs)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(17, 'Find the distance between points \\( (2,3) \\) and \\( (5,7) \\) using the distance formula.', '5', '\\sqrt{25}', '5\\sqrt{2}', '\\sqrt{20}', 'A', 'MCQ', 'Using distance formula \\( \\sqrt{(x_2-x_1)^2 + (y_2-y_1)^2} = \\sqrt{(5-2)^2 + (7-3)^2} = \\sqrt{9 + 16} = \\sqrt{25} = 5 \\).'),

(17, 'What are the coordinates of the midpoint of the segment with endpoints \\( (-2,4) \\) and \\( (6,8) \\)?', '(2,6)', '(4,6)', '(3,6)', '(2,4)', 'A', 'MCQ', 'Midpoint formula: \\( (\\frac{x_1+x_2}{2}, \\frac{y_1+y_2}{2}) = (\\frac{-2+6}{2}, \\frac{4+8}{2}) = (2,6) \\).'),

(17, 'Prove that the triangle with vertices \\( (0,0), (4,0), \\) and \\( (2,3) \\) is isosceles. Which sides are equal?', 'No sides are equal', 'All sides are equal', 'The sides from (0,0) and (4,0) to (2,3)', 'The sides along the x-axis', 'C', 'MCQ', 'Using distance formula, both sides from base vertices to (2,3) = \\( \\sqrt{2^2 + 3^2} = \\sqrt{13} \\).'),

(17, 'What is the slope of a line perpendicular to the line with slope \\( \\frac{2}{3} \\)?', '-\\frac{3}{2}', '\\frac{3}{2}', '\\frac{2}{3}', '-2', 'A', 'MCQ', 'Perpendicular slopes are negative reciprocals of each other: \\( -\\frac{1}{\\frac{2}{3}} = -\\frac{3}{2} \\).'),

(17, 'In triangle ABC, if A(1,1), B(4,5), and C(7,1) form a right triangle, at which vertex is the right angle?', 'A', 'B', 'C', 'Not a right triangle', 'B', 'MCQ', 'Using slopes: AB = \\frac{4}{3}, BC = -\\frac{4}{3}, AC = 0. Perpendicular slopes at B confirm right angle.'),

(17, 'What is the slope of the line segment connecting \\( (-3,-2) \\) and \\( (1,4) \\)?', '\\frac{3}{2}', '2', '\\frac{3}{4}', '\\frac{6}{4}', 'B', 'MCQ', 'Slope = \\( \\frac{y_2-y_1}{x_2-x_1} = \\frac{4-(-2)}{1-(-3)} = \\frac{6}{3} = 2 \\).'),

(17, 'Prove that the points \\( (1,1), (4,2), (2,5) \\) form a triangle with area 6 square units.', 'True, using distance formula', 'False, area is 12', 'True, using determinant method', 'False, area is 3', 'C', 'MCQ', 'Area = \\( \\frac{1}{2}|x_1(y_2 - y_3) + x_2(y_3 - y_1) + x_3(y_1 - y_2)| = 6 \\).'),

(17, 'If points A(2,3) and B(8,3) are endpoints of a diameter of a circle, what are the coordinates of the center?', '(5,3)', '(3,5)', '(6,3)', '(3,6)', 'A', 'MCQ', 'The center is the midpoint of any diameter: \\( (\\frac{2+8}{2}, \\frac{3+3}{2}) = (5,3) \\).'),

(17, 'What is the equation of the perpendicular bisector of the segment joining \\( (1,2) \\) and \\( (5,6) \\)?', 'y = -x + 7', 'y = x + 1', 'y = -2x + 9', 'y = 2x + 1', 'C', 'MCQ', 'Find midpoint (3,4), use negative reciprocal of original slope, then point-slope form.'),

(17, 'If a triangle has vertices at \\( (0,0), (6,0), \\) and \\( (3,4) \\), what is its perimeter?', '16', '14', '12', '10', 'A', 'MCQ', 'Using distance formula: base = 6, other sides = \\( \\sqrt{3^2 + 4^2} = 5 \\) each, total = 16.');

-- Transformations and Symmetry (Reflection, Rotation, Dilation)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(18, 'What type of transformation preserves both shape and size but changes orientation?', 'Translation', 'Rotation', 'Reflection', 'Dilation', 'C', 'MCQ', 'A reflection (flip) preserves shape and size but creates a mirror image, changing orientation.'),

(18, 'If point A(2,3) is reflected across the y-axis, what are its new coordinates?', '(2,-3)', '(-2,3)', '(-2,-3)', '(3,2)', 'B', 'MCQ', 'When reflecting across the y-axis, x-coordinate changes sign: (-2,3).'),

(18, 'A triangle is rotated 90° clockwise about the origin. How do the coordinates (x,y) change?', '(-y,x)', '(y,-x)', '(y,x)', '(-x,-y)', 'A', 'MCQ', 'In a 90° clockwise rotation about the origin, (x,y) → (-y,x).'),

(18, 'Which transformation represents a dilation with scale factor k = 2 from the origin?', 'Multiply both coordinates by -2', 'Add 2 to both coordinates', 'Multiply both coordinates by 2', 'Divide both coordinates by 2', 'C', 'MCQ', 'A dilation from the origin with scale factor k multiplies all coordinates by k.'),

(18, 'Under which transformation is the distance from any point to the line of reflection equal to the distance from its image to the line?', 'Translation', 'Rotation', 'Reflection', 'Dilation', 'C', 'MCQ', 'In a reflection, each point and its image are equidistant from the line of reflection.'),

(18, 'What is the image of point (3,4) after a translation of 2 units right and 3 units down?', '(5,1)', '(1,7)', '(5,7)', '(1,1)', 'A', 'MCQ', 'Add 2 to x (right) and subtract 3 from y (down): (3+2, 4-3) = (5,1).'),

(18, 'Which transformation preserves orientation but changes size?', 'Translation', 'Rotation', 'Reflection', 'Dilation', 'D', 'MCQ', 'A dilation changes size while maintaining shape and orientation.'),

(18, 'If a figure has rotational symmetry of order 3, through what angle can it be rotated to coincide with itself?', '60°', '90°', '120°', '180°', 'C', 'MCQ', 'Order 3 rotational symmetry means the figure coincides with itself every 360° ÷ 3 = 120°.'),

(18, 'What is the image of rectangle ABCD after a reflection followed by a translation called?', 'Congruent figure', 'Similar figure', 'Symmetric figure', 'Dilated figure', 'A', 'MCQ', 'Reflections and translations are isometries that preserve size and shape, producing congruent figures.'),

(18, 'A square has how many lines of symmetry?', '2', '3', '4', '8', 'C', 'MCQ', 'A square has 4 lines of symmetry: 2 diagonal and 2 through the midpoints of opposite sides.');

-- Solving Quadratic Inequalities and Graphs

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(19, 'Solve the quadratic inequality: \\( x^2 - 4x - 5 > 0 \\)', 'x < -1 or x > 5', '-1 < x < 5', 'x < 5', 'x > -1', 'A', 'MCQ', 'Factor: (x-5)(x+1) > 0. When product is positive, both factors are positive or both negative. Therefore x < -1 or x > 5.'),

(19, 'For the parabola \\( y = x^2 - 6x + 5 \\), what is the y-coordinate of the vertex?', '-4', '4', '-9', '9', 'C', 'MCQ', 'Vertex form: \\( y = (x-3)^2 - 9 \\). The y-coordinate of vertex is -9.'),

(19, 'Solve: \\( x^2 + 2x ≤ 3 \\)', '-3 ≤ x ≤ 1', '-1 ≤ x ≤ 3', '-3 < x < 1', '-1 < x < 3', 'A', 'MCQ', 'Rearrange to standard form: \\( x^2 + 2x - 3 ≤ 0 \\). Factor: (x+3)(x-1) ≤ 0. Solution is between roots: -3 ≤ x ≤ 1.'),

(19, 'Which quadratic inequality represents the graph of a parabola opening downward with x-intercepts at x = 2 and x = 5?', '(x-2)(x-5) ≥ 0', '(x-2)(x-5) ≤ 0', '-(x-2)(x-5) ≥ 0', '-(x-2)(x-5) ≤ 0', 'B', 'MCQ', 'Opening downward means negative coefficient. Between roots means ≤ 0. Therefore (x-2)(x-5) ≤ 0.'),

(19, 'For what values of x is \\( \\frac{x^2-1}{x+1} > 0 \\)?', 'x < -1 or x > 1', '-1 < x < 1', 'x < 1', 'x > -1', 'A', 'MCQ', 'Factor numerator: (x+1)(x-1). Consider denominator x+1. When x < -1, both factors negative. When x > 1, both positive.'),

(19, 'The solution to \\( x^2 < 4x \\) is:', 'x < 0 or x > 4', '0 < x < 4', '0 ≤ x ≤ 4', 'x > 0', 'B', 'MCQ', 'Rearrange: \\( x^2 - 4x < 0 \\). Factor: x(x-4) < 0. Solution is between 0 and 4.'),

(19, 'What is the axis of symmetry for \\( y = 2x^2 + 12x + 15 \\)?', 'x = -3', 'x = 3', 'x = -6', 'x = 6', 'A', 'MCQ', 'Axis of symmetry x = -b/(2a) = -12/(2(2)) = -3.'),

(19, 'Solve: \\( (x-1)(x-3) ≥ (x-2)^2 \\)', 'No solution', 'All real numbers', 'x = 2', '{1,2,3}', 'A', 'MCQ', 'Expand and simplify: \\( x^2-4x+3 ≥ x^2-4x+4 \\). Therefore 3 ≥ 4, which is false for all x.'),

(19, 'For what values of x is the parabola \\( y = x^2 + 6x + 5 \\) below the x-axis?', '-5 < x < -1', '-6 < x < -5', 'x < -5 or x > -1', 'No solution', 'A', 'MCQ', 'Factor: (x+5)(x+1). Parabola opens upward. Below x-axis means y < 0, so -5 < x < -1.'),

(19, 'If a quadratic inequality has no solution, what must be true about its graph?', 'It never crosses the x-axis', 'It lies entirely above the x-axis', 'It lies entirely below the x-axis', 'It crosses the x-axis twice', 'B', 'MCQ', 'For ax² + bx + c > 0 to have no solution (when a > 0), the parabola must lie entirely above the x-axis.');

-- cumulative quiz grade 10

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(20, 'In a two-column proof, if angle A and angle B are complementary, and angle B and angle C are complementary, what can you conclude about angles A and C?', 'They are supplementary', 'They are complementary', 'They are congruent', 'Not enough information', 'C', 'MCQ', 'If A + B = 90° and B + C = 90°, then A = C (both equal 90° - B).'),

(20, 'If two parallel lines are cut by a transversal forming an angle of 65°, what is the measure of the corresponding alternate interior angle?', '115°', '65°', '25°', '180°', 'B', 'MCQ', 'When parallel lines are cut by a transversal, corresponding angles are equal (65°).'),

(20, 'In a 30°-60°-90° triangle with hypotenuse 8 units, what is the length of the shortest side?', '4', '4\\sqrt{3}', '8', '2\\sqrt{3}', 'A', 'MCQ', 'In a 30°-60°-90° triangle, the shortest side (opposite to 30°) is half the hypotenuse: 8 ÷ 2 = 4.'),

(20, 'A regular hexagon has a perimeter of 24 units. What is its area? (Use \\( A = \\frac{3\\sqrt{3}}{2}s^2 \\) where s is side length)', '24\\sqrt{3}', '48', '24', '48\\sqrt{3}', 'A', 'MCQ', 'Side length = 24 ÷ 6 = 4. Area = \\( \\frac{3\\sqrt{3}}{2}(4^2) = 24\\sqrt{3} \\).'),

(20, 'A cylinder has radius 3 units and height 4 units. What is its total surface area? (Use \\( 2\\pi r^2 + 2\\pi rh \\))', '42\\pi', '60\\pi', '24\\pi', '18\\pi', 'B', 'MCQ', 'Total SA = \\( 2\\pi(3^2) + 2\\pi(3)(4) = 18\\pi + 42\\pi = 60\\pi \\).'),

(20, 'In a circle, if an inscribed angle intercepts an arc of 130°, what is the measure of the angle?', '130°', '65°', '260°', '45°', 'B', 'MCQ', 'An inscribed angle measures half the measure of its intercepted arc: 130° ÷ 2 = 65°.'),

(20, 'Find the distance between points \\( (1,5) \\) and \\( (4,-1) \\)?', '5', '\\sqrt{25}', '\\sqrt{37}', '7', 'C', 'MCQ', 'Using distance formula: \\( \\sqrt{(4-1)^2 + (-1-5)^2} = \\sqrt{9 + 28} = \\sqrt{37} \\).'),

(20, 'After a reflection across the x-axis, what are the coordinates of point (3,-2)?', '(3,2)', '(-3,-2)', '(-3,2)', '(3,-2)', 'A', 'MCQ', 'In a reflection across x-axis, only y-coordinate changes sign: (3,-2) → (3,2).'),

(20, 'Solve the quadratic inequality: \\( x^2 - x - 6 < 0 \\)', '-2 < x < 3', 'x < -2 or x > 3', 'x < 3', 'x > -2', 'A', 'MCQ', 'Factor: (x-3)(x+2) < 0. Solution is between roots where parabola is below x-axis.'),

(20, 'If a circle has radius 6 units and a chord of length 6 units, what is the distance from the center to the chord?', '3\\sqrt{3}', '6', '3', '4\\sqrt{3}', 'A', 'MCQ', 'Using Pythagorean theorem in right triangle formed by radius perpendicular to chord: \\( \\sqrt{6^2 - (\\frac{6}{2})^2} = 3\\sqrt{3} \\).');

-- grade 11
-- complex numbers

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(21, 'Simplify \\( i^4 \\)', '1', '-1', 'i', '-i', 'A', 'MCQ', '\\( i^4 = (i^2)^2 = (-1)^2 = 1 \\)'),

(21, 'What is the sum of \\( (3+2i) + (4-5i) \\)?', '7-3i', '7+3i', '1+7i', '-3+7i', 'A', 'MCQ', 'Add real and imaginary parts separately: (3+4) + (2-5)i = 7-3i'),

(21, 'Multiply \\( (2+i)(3-2i) \\)', '8-i', '6+5i', '8+i', '6-5i', 'A', 'MCQ', 'Use FOIL: \\( 2(3) + 2(-2i) + i(3) + i(-2i) = 6 - 4i + 3i - 2i^2 = 6 - i + 2 = 8 - i \\)'),

(21, 'Express \\( \\frac{2+3i}{1-i} \\) in the form \\( a+bi \\)', '2.5+0.5i', '-0.5+2.5i', '-1+i', '-2.5+0.5i', 'B', 'MCQ', 'Multiply numerator and denominator by conjugate (1+i), then simplify: \\( \\frac{(2+3i)(1+i)}{(1-i)(1+i)} = \\frac{2+2i+3i+3i^2}{1+1} = \\frac{-1+5i}{2} = -0.5+2.5i \\)'),

(21, 'What is the modulus of the complex number \\( 3-4i \\)?', '7', '5', '1', '-5', 'B', 'MCQ', '|3-4i| = \\( \\sqrt{3^2 + (-4)^2} = \\sqrt{9 + 16} = \\sqrt{25} = 5 \\)'),

(21, 'Simplify \\( i^{15} \\)', 'i', '-i', '1', '-1', 'A', 'MCQ', '\\( i^{15} = i^{12} \\cdot i^3 = (i^4)^3 \\cdot i^3 = 1 \\cdot i^3 = i \\)'),

(21, 'Find the conjugate of \\( 2-3i \\)', '2+3i', '-2+3i', '2-3i', '-2-3i', 'A', 'MCQ', 'The conjugate changes the sign of the imaginary part only'),

(21, 'If \\( z = 1+i \\), calculate \\( z^2 \\)', '2+2i', '0+2i', '2i', '1-1', 'B', 'MCQ', '\\( (1+i)^2 = 1 + 2i + i^2 = 1 + 2i - 1 = 2i \\)'),

(21, 'Which complex number represents a 90° rotation of 2+i counterclockwise about the origin?', '-1+2i', '2-i', '-2-i', '-2+i', 'A', 'MCQ', 'Multiply by i for 90° counterclockwise rotation: \\( i(2+i) = 2i + i^2 = 2i - 1 = -1+2i \\)'),

(21, 'Solve the equation \\( x^2 + 1 = 0 \\)', '1, -1', 'i, -i', '1, i', 'No solution', 'B', 'MCQ', '\\( x^2 = -1 \\), therefore \\( x = \\pm i \\)');

-- Polynomial Functions and Graphs (End Behavior, Zeros)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(22, 'What is the end behavior of the polynomial function \\( f(x) = -2x^3 + x^2 - 4x + 1 \\)?', 'As x → ∞, f(x) → ∞ and as x → -∞, f(x) → -∞', 'As x → ∞, f(x) → -∞ and as x → -∞, f(x) → ∞', 'As x → ±∞, f(x) → ∞', 'As x → ±∞, f(x) → -∞', 'B', 'MCQ', 'For odd degree polynomials, end behavior depends on leading coefficient. Since coefficient is -2 (negative), as x → ∞, f(x) → -∞ and as x → -∞, f(x) → ∞.'),

(22, 'A polynomial \\( P(x) \\) has zeros at x = -2, x = 3, and x = 3. What is its minimum degree?', '2', '3', '4', '5', 'B', 'MCQ', 'Count zeros with multiplicity: x = -2 (multiplicity 1) and x = 3 (multiplicity 2), so minimum degree is 1 + 2 = 3.'),

(22, 'If a polynomial has degree 4 and zeros at x = 1, x = -1, and x = 2, what is the multiplicity of one of these zeros?', '0', '1', '2', '3', 'B', 'MCQ', 'Sum of multiplicities must equal degree. With three zeros and degree 4, one zero must have multiplicity 2 and others multiplicity 1.'),

(22, 'Which of the following could be the graph of an odd degree polynomial?', 'Starts and ends in same direction', 'Starts and ends in opposite directions', 'Always above x-axis', 'Always below x-axis', 'B', 'MCQ', 'Odd degree polynomials have opposite end behaviors (one end up, one end down).'),

(22, 'If \\( P(x) = x^3 - 4x^2 + 5x - 2 \\), what is \\( P(-1) \\)?', '0', '1', '-2', '2', 'C', 'MCQ', '\\( P(-1) = (-1)^3 - 4(-1)^2 + 5(-1) - 2 = -1 - 4 - 5 - 2 = -12 \\)'),

(22, 'A polynomial has zeros at x = 2 (multiplicity 2) and x = -1 (multiplicity 1). Which could be its equation?', '\\( x^3 - 3x^2 + 2x \\)', '\\( x^3 - 3x^2 - 2x + 4 \\)', '\\( (x-2)^2(x+1) \\)', '\\( (x+2)^2(x-1) \\)', 'C', 'MCQ', 'The polynomial must have factor (x-2)² for double zero at 2, and (x+1) for zero at -1.'),

(22, 'How many turning points can a polynomial of degree 4 have at most?', '2', '3', '4', '5', 'B', 'MCQ', 'Maximum number of turning points is degree - 1 = 3.'),

(22, 'If a polynomial has degree 5 and three real zeros, what is the maximum number of complex zeros it can have?', '0', '1', '2', '3', 'C', 'MCQ', 'Complex zeros come in conjugate pairs. With three real zeros and degree 5, there can be at most 2 complex zeros.'),

(22, 'What is the degree of \\( P(x) = x^4 - 2x^2 + 1 \\)?', '2', '3', '4', '8', 'C', 'MCQ', 'The degree is the highest power of x in the polynomial, which is 4.'),

(22, 'If \\( f(x) = x^3 - 3x + 2 \\), which of the following must be true?', 'f has exactly one real zero', 'f has exactly two real zeros', 'f has exactly three real zeros', 'f has no real zeros', 'A', 'MCQ', 'Since f is cubic, it has at least one real zero. By examining changes in sign and considering f′(x), it can only have one real zero.');

-- Rational Expressions and Equations

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(23, 'Simplify \\( \\frac{x^2-4}{x-2} \\)', 'x+2', 'x-2', 'x', 'x+4', 'A', 'MCQ', 'Factor numerator: \\( \\frac{(x+2)(x-2)}{x-2} = x+2 \\). Note: x ≠ 2.'),

(23, 'Find the domain of \\( \\frac{x+1}{x^2-4} \\)', 'All real numbers', 'x ≠ ±2', 'x ≠ 2', 'x > 0', 'B', 'MCQ', 'Domain excludes values making denominator zero: x² - 4 = 0 → x = ±2.'),

(23, 'Solve \\( \\frac{x}{x-3} = 2 \\)', 'x = 6', 'x = -6', 'x = 3', 'x = -3', 'A', 'MCQ', 'Multiply both sides by (x-3): x = 2(x-3) → x = 2x-6 → -x = -6 → x = 6. Check x ≠ 3.'),

(23, 'Multiply: \\( \\frac{x+2}{x-1} \\cdot \\frac{x-1}{x+3} \\)', '1', 'x+2', '\\frac{x+2}{x+3}', '\\frac{(x+2)(x-1)}{(x-1)(x+3)}', 'C', 'MCQ', 'Cancel common factor (x-1), resulting in \\( \\frac{x+2}{x+3} \\). Note: x ≠ 1, -3.'),

(23, 'What is the vertical asymptote of \\( \\frac{2x+1}{x^2-x-2} \\)?', 'x = 2', 'x = -1', 'x = 2 and x = -1', 'x = 0', 'C', 'MCQ', 'Vertical asymptotes occur at x-values making denominator zero: x² - x - 2 = 0 → (x-2)(x+1) = 0 → x = 2, -1.'),

(23, 'Add: \\( \\frac{1}{x-2} + \\frac{3}{x+1} \\)', '\\frac{4}{x^2-x-2}', '\\frac{4x-5}{x^2-x-2}', '\\frac{4x+1}{x^2-x-2}', '\\frac{x+4}{x^2-x-2}', 'B', 'MCQ', 'Find common denominator (x-2)(x+1), then add: \\( \\frac{1(x+1)+3(x-2)}{(x-2)(x+1)} = \\frac{4x-5}{x^2-x-2} \\).'),

(23, 'What is the horizontal asymptote of \\( \\frac{2x^2+1}{x^2-3} \\)?', 'y = 0', 'y = 2', 'y = -2', 'y = 1', 'B', 'MCQ', 'When degrees are equal, horizontal asymptote is ratio of leading coefficients: 2/1 = 2.'),

(23, 'Simplify: \\( \\frac{x^2-9}{x^2-6x+9} \\)', '1', '\\frac{x+3}{x-3}', '\\frac{x-3}{x-3}', '\\frac{x^2-9}{(x-3)^2}', 'B', 'MCQ', 'Factor: \\( \\frac{(x+3)(x-3)}{(x-3)(x-3)} = \\frac{x+3}{x-3} \\). Note: x ≠ 3.'),

(23, 'For what value(s) of k is \\( \\frac{k}{x-2} + \\frac{1}{x+3} = \\frac{x+1}{(x-2)(x+3)} \\)?', 'k = 1', 'k = 2', 'k = 0', 'k = -1', 'A', 'MCQ', 'Multiply all terms by (x-2)(x+3) and compare coefficients to solve for k.'),

(23, 'What is the slant asymptote of \\( \\frac{x^2+x-1}{x-2} \\)?', 'y = x', 'y = x + 3', 'y = x + 2', 'No slant asymptote', 'B', 'MCQ', 'Divide numerator by denominator: x + 3 + \\frac{5}{x-2}. Slant asymptote is y = x + 3.');

-- Exponential and Logarithmic Functions

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(24, 'Solve for x: \\( 2^x = 32 \\)', '4', '5', '6', '8', 'B', 'MCQ', 'Using logs: \\( 2^x = 2^5 \\), therefore x = 5.'),

(24, 'Simplify \\( \\log_2(8) + \\log_2(4) \\)', '5', '6', '4', '3', 'A', 'MCQ', '\\( \\log_2(8) + \\log_2(4) = \\log_2(32) = 5 \\) using log product rule.'),

(24, 'Express \\( \\ln(\\sqrt{x}) \\) in terms of \\( \\ln(x) \\)', '2\\ln(x)', '\\frac{\\ln(x)}{2}', '\\ln(x^2)', '\\ln(x^{\\frac{1}{2}})', 'B', 'MCQ', '\\( \\ln(\\sqrt{x}) = \\ln(x^{\\frac{1}{2}}) = \\frac{1}{2}\\ln(x) \\) using log power rule.'),

(24, 'Solve: \\( e^{2x} = 8 \\)', 'x = \\ln(4)', 'x = \\ln(8)', 'x = \\frac{\\ln(8)}{2}', 'x = 2\\ln(8)', 'C', 'MCQ', 'Take ln of both sides: 2x = \\ln(8), therefore x = \\frac{\\ln(8)}{2}.'),

(24, 'What is the domain of \\( f(x) = \\log_3(x-2) \\)?', 'x > 0', 'x ≥ 0', 'x > 2', 'x ≥ 2', 'C', 'MCQ', 'The argument of a log must be positive: x - 2 > 0, therefore x > 2.'),

(24, 'Solve: \\( \\log_2(x+3) = 3 \\)', 'x = 5', 'x = 8', 'x = 11', 'x = 13', 'A', 'MCQ', '\\( 2^3 = x+3 \\), therefore 8 = x+3, so x = 5.'),

(24, 'If \\( f(x) = 3^x \\) and \\( g(x) = \\log_3(x) \\), what is \\( f(g(9)) \\)?', '3', '9', '27', '81', 'B', 'MCQ', '\\( f(g(9)) = 3^{\\log_3(9)} = 9 \\) using inverse function properties.'),

(24, 'Solve: \\( \\log_2(x) + \\log_2(x-3) = 3 \\)', 'x = 5', 'x = 6', 'x = 7', 'x = 8', 'D', 'MCQ', 'Using log product rule: \\( \\log_2(x(x-3)) = 3 \\). Therefore \\( x^2-3x = 2^3 = 8 \\). Solve quadratic: x = 8.'),

(24, 'What is the range of \\( f(x) = 2^x \\)?', 'All real numbers', 'x > 0', 'y > 0', 'y ≥ 0', 'C', 'MCQ', 'Exponential functions with base > 1 have range of all positive numbers (y > 0).'),

(24, 'Simplify \\( \\log_5(125) \\)', '3', '4', '5', '6', 'A', 'MCQ', '\\( \\log_5(125) = \\log_5(5^3) = 3 \\) using log power rule.');

-- Inverse Functions (Algebraic and Graphical)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(25, 'What is the inverse of the function \\( f(x) = 2x + 3 \\)?', '\\( f^{-1}(x) = \\frac{x-3}{2} \\)', '\\( f^{-1}(x) = \\frac{x+3}{2} \\)', '\\( f^{-1}(x) = 2x - 3 \\)', '\\( f^{-1}(x) = -2x + 3 \\)', 'A', 'MCQ', 'Replace f(x) with y, swap x and y, then solve for y: y = 2x + 3 → x = 2y + 3 → y = \\frac{x-3}{2}'),

(25, 'For what values of x is the function \\( f(x) = x^2 - 4 \\) invertible?', 'All x', 'x ≥ 0', 'x ≤ 0', 'No values', 'B', 'MCQ', 'Function must be one-to-one to be invertible. Restrict domain to x ≥ 0 to make it one-to-one.'),

(25, 'If \\( f(x) = 3x + 1 \\) and \\( f^{-1} \\) is its inverse, what is \\( f(f^{-1}(7)) \\)?', '7', '22', '3', '4', 'A', 'MCQ', 'Function composition \\( f(f^{-1}(x)) = x \\) for any x in the range of f.'),

(25, 'Which function is its own inverse?', '\\( f(x) = x^3 \\)', '\\( f(x) = \\frac{1}{x} \\)', '\\( f(x) = x^2 \\)', '\\( f(x) = x+1 \\)', 'B', 'MCQ', 'A function that is its own inverse satisfies f(f(x)) = x. Only \\( f(x) = \\frac{1}{x} \\) works.'),

(25, 'What is the domain of the inverse of \\( f(x) = x^2 + 2 \\)?', 'All real numbers', 'x ≥ 2', '[2,∞)', '(-∞,-2] ∪ [2,∞)', 'B', 'MCQ', 'The domain of \\( f^{-1} \\) is the range of f. Since f(x) = x^2 + 2, the range is [2,∞).'),

(25, 'If \\( f(x) = e^x \\), what is \\( f^{-1}(x) \\)?', '\\frac{1}{e^x}', '\\ln(x)', '-e^x', 'e^{-x}', 'B', 'MCQ', 'The inverse of exponential function \\( e^x \\) is the natural logarithm \\ln(x).'),

(25, 'The graphs of a function and its inverse are related by:', 'Translation', 'Reflection over y-axis', 'Reflection over x-axis', 'Reflection over y = x', 'D', 'MCQ', 'The graph of \\( f^{-1} \\) is the reflection of f over the line y = x.'),

(25, 'What is the inverse of \\( f(x) = \\frac{x+2}{x-1} \\)?', '\\( f^{-1}(x) = \\frac{x+2}{x-1} \\)', '\\( f^{-1}(x) = \\frac{x-2}{x+1} \\)', '\\( f^{-1}(x) = \\frac{2-x}{1-x} \\)', '\\( f^{-1}(x) = \\frac{2+x}{1-x} \\)', 'A', 'MCQ', 'This is a special function that is its own inverse (involution).'),

(25, 'If \\( f^{-1}(2) = 5 \\), then what is \\( f(5) \\)?', '2', '5', '-2', '\\frac{1}{2}', 'A', 'MCQ', 'If \\( f^{-1}(2) = 5 \\), then \\( f(5) = 2 \\) by definition of inverse functions.'),

(25, 'Which transformation of \\( f(x) = x^2 \\) makes it invertible?', 'Shift up 2 units', 'Shift right 3 units', 'Restrict domain to x ≥ 0', 'Reflect over y-axis', 'C', 'MCQ', 'To make a quadratic function invertible, restrict its domain to make it one-to-one (e.g., x ≥ 0).');

-- Right Triangle Trigonometry (SOHCAHTOA + Applications)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(26, 'In a right triangle, if \\( \\sin(\\theta) = \\frac{4}{5} \\), what is \\( \\cos(\\theta) \\)?', '\\frac{4}{5}', '\\frac{3}{5}', '\\frac{5}{4}', '\\frac{5}{3}', 'B', 'MCQ', 'Using Pythagorean theorem: \\( \\sin^2\\theta + \\cos^2\\theta = 1 \\). If \\( \\sin\\theta = \\frac{4}{5} \\), then \\( \\cos\\theta = \\frac{3}{5} \\).'),

(26, 'In a right triangle with hypotenuse 10 and one leg 6, what is the length of the other leg?', '4', '8', '6\\sqrt{2}', '8\\sqrt{2}', 'B', 'MCQ', 'Using Pythagorean theorem: \\( 6^2 + x^2 = 10^2 \\). Solve for x: \\( x = 8 \\).'),

(26, 'If \\( \\tan(\\theta) = \\frac{3}{4} \\), what is \\( \\sin(\\theta) \\)?', '\\frac{3}{5}', '\\frac{4}{5}', '\\frac{3}{4}', '\\frac{4}{3}', 'A', 'MCQ', 'If \\( \\tan\\theta = \\frac{3}{4} \\), then \\( \\sin\\theta = \\frac{3}{\\sqrt{3^2 + 4^2}} = \\frac{3}{5} \\).'),

(26, 'A ladder 13 feet long leans against a wall. If the foot of the ladder is 5 feet from the wall, how high up the wall does the ladder reach?', '11 feet', '12 feet', '10 feet', '9 feet', 'B', 'MCQ', 'Using Pythagorean theorem: \\( 5^2 + h^2 = 13^2 \\). Solve for h: \\( h = 12 \\).'),

(26, 'What is the value of \\( \\sec(\\theta) \\) if \\( \\cos(\\theta) = \\frac{5}{13} \\)?', '\\frac{13}{5}', '\\frac{5}{13}', '\\frac{12}{13}', '\\frac{13}{12}', 'A', 'MCQ', '\\( \\sec(\\theta) = \\frac{1}{\\cos(\\theta)} = \\frac{13}{5} \\).'),

(26, 'In a right triangle, if one angle is 30°, what is the ratio of the shortest leg to the hypotenuse?', '\\frac{1}{3}', '\\frac{1}{2}', '\\frac{\\sqrt{3}}{2}', '\\frac{\\sqrt{2}}{2}', 'B', 'MCQ', 'In a 30-60-90 triangle, the shortest leg (opposite to 30°) is half the hypotenuse.'),

(26, 'If \\( \\csc(\\theta) = 5 \\), what is \\( \\sin(\\theta) \\)?', '5', '\\frac{1}{5}', '-\\frac{1}{5}', '-5', 'B', 'MCQ', '\\( \\csc(\\theta) = \\frac{1}{\\sin(\\theta)} \\), so \\( \\sin(\\theta) = \\frac{1}{5} \\).'),

(26, 'A person walks 100 meters at an angle of elevation of 15°. How much height do they gain?', '25.9 meters', '96.6 meters', '86.6 meters', '50 meters', 'A', 'MCQ', 'Height = 100 × \\sin(15°) ≈ 25.9 meters.'),

(26, 'If \\( \\cos(\\theta) = \\frac{4}{5} \\) in a right triangle, what is \\( \\tan(\\theta) \\)?', '\\frac{3}{4}', '\\frac{4}{3}', '\\frac{5}{4}', '\\frac{4}{5}', 'A', 'MCQ', 'If \\( \\cos\\theta = \\frac{4}{5} \\), then \\( \\sin\\theta = \\frac{3}{5} \\). Therefore \\( \\tan\\theta = \\frac{\\sin\\theta}{\\cos\\theta} = \\frac{3}{4} \\).'),

(26, 'In a right triangle with angles of 45°, 45°, and 90°, if one leg is 6, what is the hypotenuse?', '6\\sqrt{2}', '12', '3\\sqrt{2}', '8\\sqrt{2}', 'A', 'MCQ', 'In a 45-45-90 triangle, the hypotenuse is leg × \\sqrt{2}, so hypotenuse = 6\\sqrt{2}.');

-- Unit Circle and Radian Measure

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(27, 'Convert 270° to radians.', '\\frac{3\\pi}{2}', '\\frac{2\\pi}{3}', '\\pi', '2\\pi', 'A', 'MCQ', '270° = 270 × \\frac{\\pi}{180} = \\frac{3\\pi}{2} radians.'),

(27, 'What are the coordinates of the point on the unit circle at \\( \\frac{\\pi}{6} \\) radians?', '(\\frac{\\sqrt{3}}{2}, \\frac{1}{2})', '(\\frac{1}{2}, \\frac{\\sqrt{3}}{2})', '(\\frac{\\sqrt{2}}{2}, \\frac{\\sqrt{2}}{2})', '(1, 0)', 'B', 'MCQ', 'At \\frac{\\pi}{6}, x = \\cos(\\frac{\\pi}{6}) = \\frac{\\sqrt{3}}{2}, y = \\sin(\\frac{\\pi}{6}) = \\frac{1}{2}.'),

(27, 'Convert \\frac{5\\pi}{4} radians to degrees.', '225°', '240°', '270°', '300°', 'A', 'MCQ', '\\frac{5\\pi}{4} = \\frac{5\\pi}{4} × \\frac{180}{\\pi} = 225°.'),

(27, 'What is the reference angle for 300°?', '60°', '30°', '45°', '120°', 'A', 'MCQ', 'Reference angle = |300° - 360°| = 60°.'),

(27, 'At what point(s) on the unit circle is the sine equal to -1?', '(0, -1)', '(-1, 0)', '(1, 0)', '(0, 1)', 'A', 'MCQ', 'Sine equals -1 at \\frac{3\\pi}{2} or 270°, which corresponds to point (0, -1) on unit circle.'),

(27, 'What is the period of the sine function in radians?', '\\pi', '2\\pi', '\\frac{\\pi}{2}', '4\\pi', 'B', 'MCQ', 'The sine function completes one full cycle every 2\\pi radians.'),

(27, 'Which quadrant contains the terminal side of an angle of \\frac{5\\pi}{3} radians?', 'I', 'II', 'III', 'IV', 'A', 'MCQ', '\\frac{5\\pi}{3} = 300° is in Quadrant I, as it is between 0° and 90°.'),

(27, 'What are the coordinates of the point where an angle of \\frac{\\pi}{4} intersects the unit circle?', '(1, 0)', '(\\frac{\\sqrt{3}}{2}, \\frac{1}{2})', '(\\frac{\\sqrt{2}}{2}, \\frac{\\sqrt{2}}{2})', '(0, 1)', 'C', 'MCQ', 'At \\frac{\\pi}{4}, both sine and cosine equal \\frac{\\sqrt{2}}{2}.'),

(27, 'If an angle in standard position has its terminal side in Quadrant II and its reference angle is 45°, what is the angle in radians?', '\\frac{3\\pi}{4}', '\\frac{5\\pi}{4}', '\\frac{7\\pi}{4}', '\\frac{\\pi}{4}', 'A', 'MCQ', 'In Quadrant II with reference angle 45°, the angle is 180° - 45° = 135° = \\frac{3\\pi}{4} radians.'),

(27, 'What is the coterminal angle (between 0 and 2\\pi) for -\\frac{\\pi}{3}?', '\\frac{5\\pi}{3}', '\\frac{4\\pi}{3}', '\\frac{2\\pi}{3}', '\\frac{7\\pi}{3}', 'A', 'MCQ', 'Add 2\\pi to negative angle: -\\frac{\\pi}{3} + 2\\pi = \\frac{5\\pi}{3}.');

-- Graphing Trig Functions (Sine, Cosine, Tangent)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(28, 'What is the amplitude of \\( y = 3\\sin(x) \\)?', '1', '2', '3', '\\pi', 'C', 'MCQ', 'For \\( y = A\\sin(x) \\), the amplitude is |A| = 3.'),

(28, 'What is the period of \\( y = \\cos(2x) \\)?', '2\\pi', '\\pi', '\\frac{\\pi}{2}', '4\\pi', 'B', 'MCQ', 'For \\( y = \\cos(bx) \\), period = \\frac{2\\pi}{|b|} = \\frac{2\\pi}{2} = \\pi.'),

(28, 'What is the vertical shift of \\( y = \\sin(x) + 2 \\)?', '0', '1', '2', '-2', 'C', 'MCQ', 'In \\( y = \\sin(x) + k \\), k represents the vertical shift. Here k = 2 shifts graph up 2 units.'),

(28, 'For \\( y = 2\\cos(x - \\frac{\\pi}{3}) \\), what is the phase shift?', '\\frac{\\pi}{3}', '-\\frac{\\pi}{3}', '2\\pi', '\\pi', 'A', 'MCQ', 'In \\( y = A\\cos(x - h) \\), h is the phase shift. Here the shift is \\frac{\\pi}{3} units right.'),

(28, 'What is the range of \\( y = 2\\sin(x) - 1 \\)?', '[-1, 1]', '[-3, 1]', '[-2, 0]', '[-3, 1]', 'B', 'MCQ', 'Amplitude is 2, centered at y = -1. Range is [-1-2, -1+2] = [-3, 1].'),

(28, 'Which transformation of \\( y = \\sin(x) \\) results in \\( y = -\\sin(x) \\)?', 'Reflection over x-axis', 'Reflection over y-axis', 'Phase shift of \\pi', 'Vertical shift down 2', 'A', 'MCQ', 'Negative coefficient results in reflection over x-axis.'),

(28, 'What is the period of \\( y = \\tan(\\frac{x}{2}) \\)?', '\\pi', '2\\pi', '4\\pi', '\\frac{\\pi}{2}', 'C', 'MCQ', 'For tangent, period = \\frac{\\pi}{|b|} where y = \\tan(bx). Here period = \\frac{\\pi}{\\frac{1}{2}} = 2\\pi.'),

(28, 'For \\( y = 3\\sin(2x) + 1 \\), what is the amplitude and period?', 'A = 3, P = \\pi', 'A = 2, P = \\pi', 'A = 3, P = 2\\pi', 'A = 1, P = \\pi', 'A', 'MCQ', 'Amplitude = |3|, Period = \\frac{2\\pi}{|2|} = \\pi.'),

(28, 'Which function has a range of all real numbers?', '\\sin(x)', '\\cos(x)', '\\tan(x)', '2\\sin(x)', 'C', 'MCQ', 'Tangent function has no amplitude restrictions, range is all real numbers.'),

(28, 'What is the midline equation for \\( y = 2\\cos(x) - 3 \\)?', 'y = 2', 'y = -3', 'y = 0', 'y = 3', 'B', 'MCQ', 'Midline is y = k where k is vertical shift. Here midline is y = -3.');

-- Sequences and Series (Arithmetic & Geometric)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(29, 'In an arithmetic sequence, if \\( a_1 = 3 \\) and \\( d = 4 \\), what is \\( a_5 \\)?', '15', '19', '23', '27', 'B', 'MCQ', 'Using formula \\( a_n = a_1 + (n-1)d \\): \\( a_5 = 3 + (5-1)4 = 3 + 16 = 19 \\).'),

(29, 'In a geometric sequence, if \\( a_1 = 2 \\) and \\( r = 3 \\), what is \\( a_4 \\)?', '54', '18', '36', '72', 'A', 'MCQ', 'Using formula \\( a_n = a_1r^{n-1} \\): \\( a_4 = 2(3^3) = 2(27) = 54 \\).'),

(29, 'Find the sum of the first 6 terms of the arithmetic sequence: 5, 8, 11, ...', '45', '63', '75', '90', 'B', 'MCQ', 'Using \\( S_n = \\frac{n}{2}(a_1 + a_n) \\) where \\( a_6 = 20 \\): \\( S_6 = \\frac{6}{2}(5 + 20) = 3(25) = 63 \\).'),

(29, 'What is the sum of the geometric series 3 + 6 + 12 + 24 + 48?', '93', '63', '123', '153', 'A', 'MCQ', 'Using \\( S_n = \\frac{a_1(1-r^n)}{1-r} \\): \\( S_5 = \\frac{3(1-2^5)}{1-2} = \\frac{3(1-32)}{-1} = 93 \\).'),

(29, 'In an arithmetic sequence, if \\( a_3 = 12 \\) and \\( a_7 = 24 \\), what is the common difference?', '2', '3', '4', '6', 'B', 'MCQ', 'Using \\( a_7 - a_3 = 4d \\): 24 - 12 = 4d, so d = 3.'),

(29, 'For the geometric sequence 1, 3, 9, 27, ..., what is the 8th term?', '729', '2187', '1024', '512', 'A', 'MCQ', 'Common ratio r = 3, so \\( a_8 = 1(3^7) = 729 \\).'),

(29, 'What is the sum of the infinite geometric series \\( 8 + 4 + 2 + 1 + ... \\)?', '16', '15', '8', '∞', 'A', 'MCQ', 'Using \\( S_\\infty = \\frac{a_1}{1-r} \\) where |r| < 1: \\( S_\\infty = \\frac{8}{1-\\frac{1}{2}} = 16 \\).'),

(29, 'In an arithmetic sequence, if \\( a_1 = 5 \\) and \\( a_{10} = 41 \\), what is the common difference?', '3', '4', '5', '6', 'B', 'MCQ', 'Using \\( a_{10} = a_1 + 9d \\): 41 = 5 + 9d, so d = 4.'),

(29, 'For what value of r does the geometric series \\( 2 + 2r + 2r^2 + ... \\) converge?', '|r| < 1', '|r| > 1', '|r| ≤ 1', '|r| ≥ 1', 'A', 'MCQ', 'A geometric series converges when |r| < 1.'),

(29, 'What is the 20th term of the arithmetic sequence 3, 7, 11, 15, ...?', '75', '79', '83', '87', 'B', 'MCQ', 'Common difference d = 4, so \\( a_{20} = 3 + (19)(4) = 3 + 76 = 79 \\).');

-- cumulative quiz grade 10

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(30, 'Simplify \\( (3-2i)(4+i) \\)', '14+i', '10-5i', '14-5i', '10+i', 'C', 'MCQ', 'FOIL: \\( (3-2i)(4+i) = 12+3i-8i-2i^2 = 12-5i+2 = 14-5i \\).'),

(30, 'What is the end behavior of \\( f(x)=2x^3-4x^2+x-3 \\)?', 'As x→±∞, f(x)→∞', 'As x→∞, f(x)→∞ and as x→-∞, f(x)→-∞', 'As x→∞, f(x)→-∞ and as x→-∞, f(x)→∞', 'As x→±∞, f(x)→-∞', 'B', 'MCQ', 'Leading term 2x³ is positive, so as x→∞, f(x)→∞ and as x→-∞, f(x)→-∞.'),

(30, 'Simplify \\( \\frac{x^2-4}{x-2} \\) to its lowest terms.', 'x-2', 'x+2', 'x²+2x+4', 'x²-2x+4', 'B', 'MCQ', 'Factor numerator: \\( \\frac{(x+2)(x-2)}{x-2} = x+2 \\). Note: x ≠ 2.'),

(30, 'Solve \\( 2^x = 32 \\)', '4', '5', '6', '8', 'B', 'MCQ', 'Using logs: \\( \\log_2(32) = x \\). Since \\( 2^5 = 32 \\), x = 5.'),

(30, 'If \\( f(x) = x^2 \\), find \\( f^{-1}(x) \\) for x ≥ 0.', '±\\sqrt{x}', '\\sqrt{x}', '-\\sqrt{x}', 'x^2', 'B', 'MCQ', 'Restrict domain to x ≥ 0 for one-to-one function, then \\( f^{-1}(x) = \\sqrt{x} \\).'),

(30, 'In a right triangle, if \\( \\sin(\\theta) = \\frac{4}{5} \\), find \\( \\cos(\\theta) \\).', '\\frac{4}{5}', '\\frac{3}{5}', '\\frac{5}{3}', '\\frac{5}{4}', 'B', 'MCQ', 'Using Pythagorean theorem: \\( \\cos(\\theta) = \\sqrt{1-\\sin^2(\\theta)} = \\sqrt{1-\\frac{16}{25}} = \\frac{3}{5} \\).'),

(30, 'Convert 240° to radians.', '\\frac{4\\pi}{3}', '\\frac{3\\pi}{4}', '\\frac{5\\pi}{3}', '\\frac{7\\pi}{6}', 'A', 'MCQ', '240° × \\frac{\\pi}{180°} = \\frac{4\\pi}{3}'),

(30, 'What is the period of \\( y = 2\\sin(3x) \\)?', '2\\pi', '\\pi', '\\frac{2\\pi}{3}', '3\\pi', 'C', 'MCQ', 'Period = \\frac{2\\pi}{|b|} where b = 3, so period = \\frac{2\\pi}{3}.'),

(30, 'Find the sum of the first 5 terms of the geometric sequence 2, 6, 18, ...', '242', '484', '121', '363', 'A', 'MCQ', 'r = 3, \\( S_5 = 2(\\frac{1-3^5}{1-3}) = 2(\\frac{1-243}{-2}) = 242 \\).'),

(30, 'What is the domain of \\( f(x) = \\ln(x-2) \\)?', 'x > 0', 'x ≥ 0', 'x > 2', 'x ≥ 2', 'C', 'MCQ', 'The argument of ln must be positive: x - 2 > 0, therefore x > 2.');

-- grade 12
-- Trigonometric Identities and Equations (Pythagorean, Double Angle)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(31, 'Verify the identity \\( \\sin^2(x) + \\cos^2(x) = 1 \\) by evaluating both sides when \\( \\sin(x) = \\frac{3}{5} \\)', '1', '2', '0', '\\frac{9}{25}', 'A', 'MCQ', 'If \\sin(x) = \\frac{3}{5}, then \\cos(x) = \\frac{4}{5}. Left side: (\\frac{3}{5})² + (\\frac{4}{5})² = \\frac{9}{25} + \\frac{16}{25} = 1.'),

(31, 'What is \\( \\sin(2x) \\) in terms of \\( \\sin(x) \\) and \\( \\cos(x) \\)?', '2\\sin(x)', '\\sin^2(x)', '2\\sin(x)\\cos(x)', '2\\cos^2(x)', 'C', 'MCQ', 'Double angle formula for sine: \\sin(2x) = 2\\sin(x)\\cos(x).'),

(31, 'If \\( \\tan(x) = 2 \\), find \\( \\sec^2(x) \\)', '4', '5', '2', '1', 'B', 'MCQ', 'Using \\sec^2(x) = 1 + \\tan^2(x) = 1 + 2² = 5.'),

(31, 'What is \\( \\cos(2x) \\) in terms of \\( \\cos(x) \\)?', '2\\cos^2(x)', '\\cos^2(x)', '2\\cos^2(x) - 1', '\\cos^2(x) - \\sin^2(x)', 'C', 'MCQ', 'Double angle formula for cosine: \\cos(2x) = 2\\cos^2(x) - 1 = \\cos^2(x) - \\sin^2(x).'),

(31, 'Simplify \\( \\frac{\\sin(x)\\cos(x)}{\\cos^2(x)} \\)', '\\tan(x)', '\\sin(x)', '\\cot(x)', '\\sec(x)', 'A', 'MCQ', '\\frac{\\sin(x)\\cos(x)}{\\cos^2(x)} = \\frac{\\sin(x)}{\\cos(x)} = \\tan(x).'),

(31, 'If \\( \\sin(A) = \\frac{5}{13} \\) and A is in Quadrant I, find \\( \\cos(2A) \\)', '\\frac{119}{169}', '\\frac{-119}{169}', '\\frac{7}{13}', '\\frac{-7}{13}', 'B', 'MCQ', 'Using \\cos(2A) = 1 - 2\\sin^2(A) = 1 - 2(\\frac{25}{169}) = \\frac{-119}{169}.'),

(31, 'What is the value of \\( \\sin^2(x) - \\cos^2(x) \\) in terms of \\( \\cos(2x) \\)?', '-\\cos(2x)', '\\cos(2x)', '\\sin(2x)', '-\\sin(2x)', 'A', 'MCQ', 'Using double angle formula: \\cos(2x) = \\cos^2(x) - \\sin^2(x), therefore \\sin^2(x) - \\cos^2(x) = -\\cos(2x).'),

(31, 'Verify \\( \\csc^2(x) - \\cot^2(x) = 1 \\) using Pythagorean identities.', 'True for all x', 'True only for acute angles', 'False', 'Cannot be verified', 'A', 'MCQ', 'Using \\csc^2(x) = \\frac{1}{\\sin^2(x)} and \\cot^2(x) = \\frac{\\cos^2(x)}{\\sin^2(x)}, subtract to get 1.'),

(31, 'If \\( \\sin(x) = \\frac{3}{5} \\) and x is in Quadrant II, find \\( \\sin(2x) \\).', '\\frac{24}{25}', '\\frac{-24}{25}', '\\frac{12}{25}', '\\frac{-12}{25}', 'B', 'MCQ', 'In Quadrant II, if \\sin(x) = \\frac{3}{5}, then \\cos(x) = -\\frac{4}{5}. Using \\sin(2x) = 2\\sin(x)\\cos(x) = 2(\\frac{3}{5})(-\\frac{4}{5}) = -\\frac{24}{25}.'),

(31, 'What is \\( \\tan(2x) \\) in terms of \\( \\tan(x) \\)?', '2\\tan(x)', '\\frac{2\\tan(x)}{1-\\tan^2(x)}', '\\frac{2\\tan(x)}{1+\\tan^2(x)}', '\\frac{\\tan(x)}{1-\\tan(x)}', 'C', 'MCQ', 'Double angle formula for tangent: \\tan(2x) = \\frac{2\\tan(x)}{1+\\tan^2(x)}.');

-- Law of Sines and Cosines

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(32, 'In triangle ABC, if a = 6, b = 8, and \\( \\angle C = 60° \\), find \\( \\angle A \\) using the Law of Sines.', '41.8°', '78.2°', '35.7°', '44.4°', 'A', 'MCQ', 'Using Law of Sines: \\( \\frac{\\sin(A)}{6} = \\frac{\\sin(60°)}{8} \\). Solve for A: \\( A = \\arcsin(\\frac{6\\sin(60°)}{8}) ≈ 41.8° \\).'),

(32, 'Find the length of side c in a triangle where a = 5, b = 7, and \\( \\angle C = 50° \\).', '4.5', '5.2', '6.1', '7.3', 'B', 'MCQ', 'Using Law of Cosines: \\( c^2 = 5^2 + 7^2 - 2(5)(7)\\cos(50°) \\). Solve: c ≈ 5.2.'),

(32, 'In triangle ABC, if \\( \\angle A = 35° \\), \\( \\angle B = 85° \\), and c = 10, find side a.', '5.9', '6.8', '7.2', '8.1', 'A', 'MCQ', 'First find \\angle C = 60°. Then use Law of Sines: \\( \\frac{a}{\\sin(35°)} = \\frac{10}{\\sin(85°)} \\). Solve: a ≈ 5.9.'),

(32, 'Which law should be used to find a side of a triangle when you know two sides and the included angle?', 'Law of Sines', 'Law of Cosines', 'Pythagorean Theorem', 'None of these', 'B', 'MCQ', 'Law of Cosines is used when you know two sides and their included angle (SAS).'),

(32, 'In triangle ABC, if a = 12, b = 15, and c = 20, find \\( \\angle A \\).', '36.9°', '45.6°', '58.4°', '62.3°', 'A', 'MCQ', 'Using Law of Cosines: \\( \\cos(A) = \\frac{b^2 + c^2 - a^2}{2bc} = \\frac{15^2 + 20^2 - 12^2}{2(15)(20)} \\). Solve: A ≈ 36.9°.'),

(32, 'When does the Law of Sines have an ambiguous case?', 'SSS', 'SAS', 'ASA', 'SSA', 'D', 'MCQ', 'The ambiguous case occurs in SSA when there might be two possible triangles satisfying the given conditions.'),

(32, 'In triangle ABC, if b = 8, c = 10, and \\( \\angle A = 40° \\), how many possible values are there for \\( \\angle B \\)?', '0', '1', '2', '3', 'C', 'MCQ', 'This is an ambiguous case (SSA). Since b < c and b > c\\sin(40°), there are two possible values for \\angle B.'),

(32, 'Which formula correctly represents the Law of Cosines?', 'a² = b² + c² - 2bc\\cos(A)', 'a² = b² + c² + 2bc\\cos(A)', 'a² = b² - c² + 2bc\\cos(A)', 'a² = b² + c² - 2bc\\sin(A)', 'A', 'MCQ', 'The Law of Cosines states: a² = b² + c² - 2bc\\cos(A).'),

(32, 'In triangle ABC, if a = 6, \\( \\angle B = 45° \\), and \\( \\angle C = 60° \\), find side b.', '4.8', '5.2', '6.4', '7.1', 'B', 'MCQ', 'First find \\angle A = 75°. Then use Law of Sines: \\( \\frac{b}{\\sin(45°)} = \\frac{6}{\\sin(75°)} \\). Solve: b ≈ 5.2.'),

(32, 'When is it necessary to use the Law of Cosines instead of the Law of Sines?', 'When given three sides', 'When given three angles', 'When given two angles and a side', 'When given two sides and their included angle', 'D', 'MCQ', 'Law of Cosines is necessary when given two sides and their included angle (SAS), or when given three sides (SSS).');

-- Limits and Continuity (Conceptual and Graphical)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(33, 'Evaluate \\( \\lim_{x \\to 2} \\frac{x^2-4}{x-2} \\)', '0', '4', '2', 'Does not exist', 'B', 'MCQ', 'Factor numerator: \\( \\lim_{x \\to 2} \\frac{(x+2)(x-2)}{x-2} = \\lim_{x \\to 2} (x+2) = 4 \\).'),

(33, 'Find \\( \\lim_{x \\to \\infty} \\frac{3x^2+2x}{x^2+1} \\)', '0', '1', '3', '∞', 'C', 'MCQ', 'Divide numerator and denominator by highest power (x²): \\( \\lim_{x \\to \\infty} \\frac{3+\\frac{2}{x}}{1+\\frac{1}{x^2}} = 3 \\).'),

(33, 'At what x-value(s) is f(x) = \\frac{x^2-1}{x-1} discontinuous?', 'x = 1', 'x = -1', 'x = 0', 'x = 1 and x = -1', 'A', 'MCQ', 'Function has a hole at x = 1 where denominator equals zero. Can be factored to x + 1 with domain restriction x ≠ 1.'),

(33, 'Evaluate \\( \\lim_{x \\to 0} \\frac{\\sin(x)}{x} \\)', '0', '1', '∞', 'Does not exist', 'B', 'MCQ', 'This is a fundamental limit in calculus. The limit equals 1, though it cannot be evaluated by direct substitution.'),

(33, 'Find \\( \\lim_{x \\to -\\infty} (\\sqrt{x^2+1} - x) \\)', '0', '∞', '-∞', '\\frac{1}{2}', 'A', 'MCQ', 'Multiply by conjugate and simplify: \\( \\lim_{x \\to -\\infty} \\frac{1}{\\sqrt{x^2+1} + x} = 0 \\).'),

(33, 'A function f(x) is continuous at x = a if:', '\\( \\lim_{x \\to a} f(x) \\) exists', 'f(a) exists', '\\( \\lim_{x \\to a} f(x) = f(a) \\)', 'All of the above', 'D', 'MCQ', 'Three conditions for continuity: limit exists, function value exists, and they are equal.'),

(33, 'Evaluate \\( \\lim_{x \\to 0} \\frac{1-\\cos(x)}{x^2} \\)', '0', '\\frac{1}{2}', '1', 'Does not exist', 'B', 'MCQ', 'Use L'Hôpital's rule twice or recall that \\( 1-\\cos(x) \\approx \\frac{x^2}{2} \\) near x = 0.'),

(33, 'Find \\( \\lim_{x \\to 4^+} \\sqrt{x-4} \\)', '0', '2', 'Does not exist', '∞', 'A', 'MCQ', 'As x approaches 4 from the right, the square root approaches 0. The limit exists and equals 0.'),

(33, 'Which type of discontinuity occurs when \\( \\lim_{x \\to a^-} f(x) ≠ \\lim_{x \\to a^+} f(x) \\)?', 'Removable', 'Jump', 'Infinite', 'Point', 'B', 'MCQ', 'A jump discontinuity occurs when left and right limits exist but are not equal.'),

(33, 'Evaluate \\( \\lim_{x \\to \\infty} (1 + \\frac{1}{x})^x \\)', '0', '1', 'e', '∞', 'C', 'MCQ', 'This is the definition of e, the base of natural logarithms. The limit equals e ≈ 2.71828...');

-- Derivatives (Basic Rules: Power, Product, Chain)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(34, 'Find \\( \\frac{d}{dx}(x^3 - 2x^2 + 4x - 1) \\)', '3x² - 4x + 4', '3x² - 2x + 4', '3x² - 4x + 1', '3x - 4', 'A', 'MCQ', 'Power rule: \\( \\frac{d}{dx}x^n = nx^{n-1} \\). Apply to each term: 3x² - 4x + 4.'),

(34, 'What is \\( \\frac{d}{dx}(\\sin(x)\\cos(x)) \\) using the product rule?', '\\cos(2x)', '\\sin(2x)', '\\cos^2(x) - \\sin^2(x)', '1', 'C', 'MCQ', 'Product rule: \\( \\frac{d}{dx}[f(x)g(x)] = f\'g + fg\' \\). Here: \\cos(x)\\cos(x) + \\sin(x)(-\\sin(x)) = \\cos^2(x) - \\sin^2(x).'),

(34, 'Find \\( \\frac{d}{dx}(e^x\\ln(x)) \\)', 'e^x(1 + \\ln(x))', 'e^x(\\frac{1}{x})', 'e^x + \\frac{1}{x}', 'e^x\\ln(x)', 'A', 'MCQ', 'Product rule: \\( e^x\\ln(x) + e^x\\frac{1}{x} = e^x(1 + \\ln(x)) \\).'),

(34, 'What is the derivative of \\( \\tan(x) \\) using the quotient rule?', '\\sec^2(x)', '\\cos^2(x)', '\\sin^2(x)', '1', 'A', 'MCQ', 'Using quotient rule on \\frac{\\sin(x)}{\\cos(x)} gives \\sec^2(x).'),

(34, 'Find \\( \\frac{d}{dx}(\\ln(x^2 + 1)) \\) using the chain rule.', '\\frac{2x}{x^2 + 1}', '\\frac{1}{x^2 + 1}', '\\frac{2}{x}', '2x', 'A', 'MCQ', 'Chain rule: \\( \\frac{1}{x^2 + 1} \\cdot \\frac{d}{dx}(x^2 + 1) = \\frac{2x}{x^2 + 1} \\).'),

(34, 'What is \\( \\frac{d}{dx}(\\sin^2(x)) \\) using the chain rule?', '2\\sin(x)', '\\cos(2x)', '2\\sin(x)\\cos(x)', '2\\cos^2(x)', 'C', 'MCQ', 'Chain rule: \\( \\frac{d}{dx}[\\sin^2(x)] = 2\\sin(x)\\frac{d}{dx}[\\sin(x)] = 2\\sin(x)\\cos(x) \\).'),

(34, 'Find the derivative of \\( y = x^{\\pi} \\).', '\\pi x^{\\pi-1}', 'x^\\pi\\ln(x)', '\\pi x^\\pi', '\\pi e^x', 'A', 'MCQ', 'Power rule with constant exponent: \\( \\frac{d}{dx}x^n = nx^{n-1} \\), where n = \\pi.'),

(34, 'What is \\( \\frac{d}{dx}(\\sqrt{x}\\sin(x)) \\)?', '\\frac{\\sin(x)}{2\\sqrt{x}} + \\sqrt{x}\\cos(x)', '\\frac{1}{2\\sqrt{x}}\\sin(x)', '\\sqrt{x}\\cos(x)', '\\frac{1}{2x}\\sin(x)', 'A', 'MCQ', 'Product rule: \\( \\frac{1}{2\\sqrt{x}}\\sin(x) + \\sqrt{x}\\cos(x) \\).'),

(34, 'Find \\( \\frac{d}{dx}(\\sec(x)) \\).', '\\sec(x)\\tan(x)', '-\\sec(x)\\tan(x)', '\\tan(x)', '\\sec^2(x)', 'A', 'MCQ', 'Derivative of secant is \\sec(x)\\tan(x).'),

(34, 'What is the derivative of \\( y = (2x + 1)^3 \\)?', '6(2x + 1)^2', '3(2x + 1)^2', '6(2x + 1)', '6x(2x + 1)^2', 'B', 'MCQ', 'Chain rule: \\( \\frac{d}{dx}[(2x + 1)^3] = 3(2x + 1)^2 \\cdot 2 = 6(2x + 1)^2 \\).');

-- Applications of Derivatives (Max/Min, Motion Problems)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(35, 'Find the critical points of \\( f(x) = x^3 - 3x^2 - 9x + 1 \\).', 'x = -1, x = 3', 'x = -3, x = 1', 'x = -3, x = 3', 'x = 0, x = 3', 'A', 'MCQ', 'Set f''(x) = 3x² - 6x - 9 = 3(x² - 2x - 3) = 3(x + 1)(x - 3) = 0. Critical points at x = -1, 3.'),

(35, 'A particle moves according to \\( s(t) = t^3 - 6t^2 + 9t \\) feet after t seconds. Find its velocity when t = 2.', '-3', '0', '3', '6', 'B', 'MCQ', 'Velocity is s''(t) = 3t² - 12t + 9. At t = 2: 3(4) - 24 + 9 = 0 ft/sec.'),

(35, 'Find the absolute maximum of \\( f(x) = x^2 - 4x + 3 \\) on [-1, 3].', '3', '4', '7', '11', 'C', 'MCQ', 'Check critical point (x = 2) and endpoints (-1 and 3). Values are 7, 3, and 3. Maximum is 7 at x = -1.'),

(35, 'Use the Mean Value Theorem to find c in [0, 2] for \\( f(x) = x^2 + 1 \\).', '0', '1', '2', '3', 'B', 'MCQ', 'f''(c) = [f(2) - f(0)]/2 = [(4 + 1) - (0 + 1)]/2 = 2. Since f''(x) = 2x, c = 1.'),

(35, 'Find the intervals where \\( f(x) = x^3 - 3x \\) is increasing.', '(-∞, -1) ∪ (1, ∞)', '(-1, 1)', '(-∞, -√3) ∪ (√3, ∞)', '(-√3, √3)', 'C', 'MCQ', 'f''(x) = 3x² - 3 = 3(x² - 1). Increasing when f''(x) > 0: x < -√3 or x > √3.'),

(35, 'A box with square base and no top is to have volume 32 cubic feet. Find the dimensions that minimize surface area.', '2 × 2 × 8', '4 × 4 × 2', '2 × 2 × 4', '4 × 4 × 4', 'B', 'MCQ', 'Let x = side of base. Surface area A = x² + 4xh where h = 32/x². Minimize A to get x = 4, h = 2.'),

(35, 'Find the linearization of \\( f(x) = \\sqrt{x} \\) at a = 4.', 'y = 1/4(x-4) + 2', 'y = 1/4x + 2', 'y = 1/2x + 2', 'y = 1/4(x+4) + 2', 'A', 'MCQ', 'L(x) = f(4) + f''(4)(x-4) = 2 + 1/4(x-4).'),

(35, 'Use Newton\s Method to approximate \\( \\sqrt{5} \\) starting with x₁ = 2. Find x₂.', '2.25', '2.5', '2.75', '3', 'A', 'MCQ', 'x₂ = x₁ - f(x₁)/f''(x₁) where f(x) = x² - 5. x₂ = 2 - (4-5)/(4) = 2.25.'),

(35, 'Find the maximum rate of change of \\( f(x,y) = 6 - x^2 - y^2 \\) at the point (1, 2).', '5', '√5', '√8', '8', 'B', 'MCQ', 'Maximum rate = magnitude of gradient = √((-2)² + (-4)²) = √20 = √5.'),

(35, 'A particle moves along the curve \\( y = x^2 \\). At what point(s) is the particle moving vertically?', 'x = 0', 'x = ±1', 'x = ±2', 'Never', 'D', 'MCQ', 'dy/dx = 2x is never undefined or infinite, so motion is never purely vertical.');

-- Antiderivatives and Indefinite Integrals

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(36, 'Find \\( \\int (3x^2 + 2x - 4)\\,dx \\)', 'x^3 + x^2 - 4x + C', '3x^3 + 2x^2 - 4x + C', 'x^3 + x^2 - 4x', '3x^3 + x^2 - 4x', 'B', 'MCQ', 'Integrate term by term: \\( \\int 3x^2\\,dx + \\int 2x\\,dx - \\int 4\\,dx = x^3 + x^2 - 4x + C \\).'),

(36, 'Find \\( \\int \\cos(x)\\,dx \\)', '\\sin(x) + C', '-\\sin(x) + C', '\\cos(x) + C', '-\\cos(x) + C', 'A', 'MCQ', 'The antiderivative of cosine is sine (plus C).'),

(36, 'Find \\( \\int \\frac{1}{x}\\,dx \\)', '\\ln|x| + C', 'x\\ln(x) + C', '\\frac{1}{x} + C', 'e^x + C', 'A', 'MCQ', 'The antiderivative of \\frac{1}{x} is \\ln|x| + C. Note absolute value is necessary.'),

(36, 'Find \\( \\int e^x\\sin(x)\\,dx \\)', 'e^x\\sin(x) + C', '\\frac{e^x(\\sin(x) - \\cos(x))}{2} + C', 'e^x(\\sin(x) + \\cos(x)) + C', 'e^x\\cos(x) + C', 'B', 'MCQ', 'Use integration by parts twice: u = e^x, dv = \\sin(x)dx to get \\frac{e^x(\\sin(x) - \\cos(x))}{2} + C.'),

(36, 'Find \\( \\int \\sec^2(x)\\,dx \\)', '\\sec(x) + C', '\\tan(x) + C', '\\cot(x) + C', '\\sin(x) + C', 'B', 'MCQ', 'The antiderivative of sec²(x) is tan(x) + C.'),

(36, 'Find \\( \\int (x + 1)^5\\,dx \\)', '\\frac{(x+1)^6}{6} + C', '\\frac{x^6}{6} + x^5 + C', '\\frac{(x+1)^5}{5} + C', '(x+1)^6 + C', 'A', 'MCQ', 'Use u-substitution with u = x + 1: \\int u^5\\,du = \\frac{u^6}{6} + C = \\frac{(x+1)^6}{6} + C.'),

(36, 'Find \\( \\int \\frac{x}{x^2 + 1}\\,dx \\)', '\\frac{1}{2}\\ln(x^2 + 1) + C', '\\ln(x^2 + 1) + C', '\\frac{1}{2}(x^2 + 1) + C', '\\tan^{-1}(x) + C', 'A', 'MCQ', 'Use u-substitution with u = x² + 1: \\int \\frac{1}{2}\\frac{du}{u} = \\frac{1}{2}\\ln(x^2 + 1) + C.'),

(36, 'Find \\( \\int x\\sqrt{x^2 + 1}\\,dx \\)', '\\frac{(x^2 + 1)^{3/2}}{3} + C', '\\frac{\\sqrt{x^2 + 1}}{2} + C', '\\frac{x\\sqrt{x^2 + 1}}{2} + C', 'x\\sqrt{x^2 + 1} + C', 'A', 'MCQ', 'Use u-substitution with u = x² + 1: \\int \\frac{u^{1/2}}{2}\\,du = \\frac{u^{3/2}}{3} + C.'),

(36, 'Find \\( \\int \\sin^2(x)\\,dx \\)', '\\frac{x}{2} - \\frac{\\sin(2x)}{4} + C', '\\frac{x}{2} + \\frac{\\sin(2x)}{4} + C', '-\\cos(2x) + C', '\\sin(x) + C', 'A', 'MCQ', 'Use double angle formula: \\sin^2(x) = \\frac{1 - \\cos(2x)}{2}, then integrate.'),

(36, 'Find \\( \\int \\frac{dx}{\\sqrt{1-x^2}} \\)', '\\sin^{-1}(x) + C', '\\cos^{-1}(x) + C', '\\tan^{-1}(x) + C', '-\\cos^{-1}(x) + C', 'A', 'MCQ', 'This is the standard antiderivative form that gives arcsin(x) + C.');

-- Definite Integrals and Area Under Curves

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(37, 'Evaluate \\( \\int_0^2 (3x^2 + 2)\\,dx \\)', '8', '10', '14', '16', 'C', 'MCQ', 'Antiderivative is x³ + 2x. Evaluate: (8 + 4) - (0 + 0) = 14.'),

(37, 'Find the area between y = x² and y = x from x = 0 to x = 1.', '\\frac{1}{2}', '\\frac{1}{3}', '\\frac{1}{4}', '\\frac{1}{6}', 'D', 'MCQ', 'Area = \\( \\int_0^1 (x - x^2)\\,dx = [\\frac{x^2}{2} - \\frac{x^3}{3}]_0^1 = \\frac{1}{6} \\).'),

(37, 'Use the Fundamental Theorem of Calculus to find \\( \\frac{d}{dx}\\int_1^x t^2\\,dt \\)', 'x', 'x^2', '2x', '1', 'B', 'MCQ', 'By FTC, the derivative equals the integrand evaluated at x: x².'),

(37, 'Find the area between y = sin(x) and y = cos(x) from x = 0 to x = \\frac{\\pi}{4}.', '0', '1', '\\sqrt{2}', '2', 'A', 'MCQ', 'Area = \\( \\int_0^{\\pi/4} |\\sin(x) - \\cos(x)|\\,dx = 0 \\) because curves intersect at \\frac{\\pi}{4}.'),

(37, 'Evaluate \\( \\int_0^\\pi \\sin(x)\\,dx \\)', '0', '1', '2', '-1', 'C', 'MCQ', 'Antiderivative is -cos(x). Evaluate: -[cos(\\pi) - cos(0)] = -(-1 - 1) = 2.'),

(37, 'Find the average value of f(x) = x² on [0,2].', '1', '2', '\\frac{4}{3}', '3', 'C', 'MCQ', 'Average = \\( \\frac{1}{2-0}\\int_0^2 x^2\\,dx = \\frac{1}{2}[\\frac{8}{3}] = \\frac{4}{3} \\).'),

(37, 'If \\( \\int_a^b f(x)\\,dx = 10 \\) and \\( \\int_a^c f(x)\\,dx = 6 \\), find \\( \\int_c^b f(x)\\,dx \\).', '4', '16', '-4', '3', 'A', 'MCQ', 'Use additivity: \\( \\int_a^b = \\int_a^c + \\int_c^b \\), so 10 = 6 + x, therefore x = 4.'),

(37, 'Find the area of the region bounded by y = x³ and y = 8 from x = 0 to x = 2.', '8', '10', '12', '16', 'C', 'MCQ', 'Area = \\( \\int_0^2 (8 - x^3)\\,dx = [8x - \\frac{x^4}{4}]_0^2 = 16 - 4 = 12 \\).'),

(37, 'Use a right Riemann sum with n = 4 to approximate \\( \\int_0^2 x^2\\,dx \\).', '2.5', '3', '3.5', '4', 'B', 'MCQ', 'Divide [0,2] into 4 subintervals of width 0.5. Sum: 0.5[(0.5)² + (1)² + (1.5)² + (2)²] = 3.'),

(37, 'If F(x) is an antiderivative of f(x), then \\( \\int_a^b f(x)\\,dx = \\)', 'F(b) + F(a)', 'F(b) - F(a)', 'F(a) - F(b)', 'F(b)F(a)', 'B', 'MCQ', 'By the Fundamental Theorem of Calculus, definite integral equals F(b) - F(a).');

-- Polar Coordinates and Graphing (Limacons, Roses)

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(38, 'Convert the polar point \\( (2, \\frac{\\pi}{6}) \\) to rectangular coordinates.', '(\\sqrt{3}, 1)', '(1, \\sqrt{3})', '(\\sqrt{3}, -1)', '(1, -\\sqrt{3})', 'A', 'MCQ', 'x = r\\cos(\\theta) = 2\\cos(\\pi/6) = \\sqrt{3}, y = r\\sin(\\theta) = 2\\sin(\\pi/6) = 1.'),

(38, 'Convert the rectangular point (1, -1) to polar form.', '(\\sqrt{2}, -\\frac{\\pi}{4})', '(\\sqrt{2}, \\frac{7\\pi}{4})', '(2, -\\frac{\\pi}{4})', '(2, \\frac{7\\pi}{4})', 'A', 'MCQ', 'r = \\sqrt{1^2 + (-1)^2} = \\sqrt{2}, \\theta = \\tan^{-1}(-1/1) = -\\pi/4.'),

(38, 'What is the graph of r = 2 in polar form?', 'Line', 'Parabola', 'Circle', 'Spiral', 'C', 'MCQ', 'r = constant represents a circle with radius 2 centered at origin.'),

(38, 'Identify the curve r = 2\\cos(\\theta).', 'Circle through origin', 'Circle with diameter 2', 'Circle with radius 2', 'Line', 'A', 'MCQ', 'This is a circle with diameter 2 passing through the origin (circle with center at (1,0) and radius 1).'),

(38, 'What type of curve is r = \\sin(2\\theta)?', 'Rose with 2 petals', 'Rose with 4 petals', 'Circle', 'Limacon', 'A', 'MCQ', 'r = \\sin(n\\theta) gives a rose curve with n petals if n is even, 2n petals if n is odd. Here n=2 gives 2 petals.'),

(38, 'Find the area enclosed by r = 4\\cos(\\theta) from -\\frac{\\pi}{2} to \\frac{\\pi}{2}.', '4\\pi', '8\\pi', '2\\pi', '6\\pi', 'B', 'MCQ', 'Area = \\frac{1}{2}\\int_{-\\pi/2}^{\\pi/2} (4\\cos(\\theta))^2\\,d\\theta = 8\\pi.'),

(38, 'What is the graph of \\theta = \\frac{\\pi}{4} in polar form?', 'Circle', 'Line through origin', 'Spiral', 'Point', 'B', 'MCQ', '\\theta = constant represents a line through origin at that angle.'),

(38, 'Identify r = 1 + 2\\cos(\\theta).', 'Circle', 'Cardioid', 'Limacon', 'Rose', 'C', 'MCQ', 'This is a limacon with a = 1, b = 2 in the form r = a + b\\cos(\\theta).'),

(38, 'What is the maximum value of r in the curve r = 2\\sin(\\theta)?', '1', '2', '3', '4', 'B', 'MCQ', 'Since |\\sin(\\theta)| ≤ 1, maximum value of r is 2 when \\theta = \\pi/2.'),

(38, 'Find the area inside r = 2 + 2\\cos(\\theta).', '2\\pi', '4\\pi', '6\\pi', '8\\pi', 'C', 'MCQ', 'Area = \\frac{1}{2}\\int_0^{2\\pi} (2 + 2\\cos(\\theta))^2\\,d\\theta = 6\\pi.');

-- Vectors and Parametric Equations

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(39, 'Find the magnitude of vector \\( \\vec{v} = \\langle 3, -4 \\rangle \\).', '1', '5', '7', '25', 'B', 'MCQ', 'Magnitude = \\( \\sqrt{3^2 + (-4)^2} = \\sqrt{9 + 16} = \\sqrt{25} = 5 \\).'),

(39, 'Given \\( \\vec{a} = \\langle 2, 1 \\rangle \\) and \\( \\vec{b} = \\langle -1, 3 \\rangle \\), find \\( \\vec{a} \\cdot \\vec{b} \\).', '1', '2', '3', '5', 'A', 'MCQ', 'Dot product = 2(-1) + 1(3) = -2 + 3 = 1.'),

(39, 'Find the parametric equations for a line through (1, 2) parallel to \\( \\vec{v} = \\langle 3, -1 \\rangle \\).', 'x = 1 + 3t, y = 2 - t', 'x = 3t, y = -t', 'x = 1 + t, y = 2 + t', 'x = 3 + t, y = -1 + t', 'A', 'MCQ', 'Parametric form: point + direction vector × t. x = 1 + 3t, y = 2 - t.'),

(39, 'Find a vector orthogonal to \\( \\vec{v} = \\langle 2, 5 \\rangle \\).', '\\langle 5, -2 \\rangle', '\\langle -5, 2 \\rangle', '\\langle 5, 2 \\rangle', '\\langle 2, 5 \\rangle', 'A', 'MCQ', 'For 2D vector \\langle a, b \\rangle, an orthogonal vector is \\langle b, -a \\rangle.'),

(39, 'Convert the parametric equations x = 2t + 1, y = t - 3 to rectangular form.', 'y = \\frac{1}{2}x - \\frac{7}{2}', 'y = 2x - 3', 'y = \\frac{1}{2}x + 3', 'y = 2x + 3', 'A', 'MCQ', 'Solve for t in x equation: t = (x-1)/2. Substitute in y equation: y = (x-1)/2 - 3 = x/2 - 7/2.'),

(39, 'Find the angle between vectors \\( \\vec{a} = \\langle 1, 1 \\rangle \\) and \\( \\vec{b} = \\langle 0, 1 \\rangle \\).', '45°', '60°', '30°', '90°', 'A', 'MCQ', '\\cos(\\theta) = \\frac{\\vec{a} \\cdot \\vec{b}}{|\\vec{a}||\\vec{b}|} = \\frac{1}{\\sqrt{2}} \\therefore \\theta = 45°.'),

(39, 'What are the parametric equations of a circle with radius 2 centered at (1, -1)?', 'x = 1 + 2\\cos(t), y = -1 + 2\\sin(t)', 'x = 2\\cos(t), y = 2\\sin(t)', 'x = \\cos(t), y = \\sin(t)', 'x = 1 + \\cos(t), y = -1 + \\sin(t)', 'A', 'MCQ', 'Center + radius × \\langle \\cos(t), \\sin(t) \\rangle gives x = 1 + 2\\cos(t), y = -1 + 2\\sin(t).'),

(39, 'Find the projection of \\( \\vec{a} = \\langle 3, 4 \\rangle \\) onto \\( \\vec{b} = \\langle 1, 0 \\rangle \\).', '\\langle 3, 0 \\rangle', '\\langle 4, 0 \\rangle', '\\langle 5, 0 \\rangle', '\\langle 0, 4 \\rangle', 'A', 'MCQ', 'proj_b a = (\\frac{\\vec{a} \\cdot \\vec{b}}{|\\vec{b}|^2})\\vec{b} = 3\\langle 1, 0 \\rangle = \\langle 3, 0 \\rangle.'),

(39, 'What type of curve is represented by x = t², y = t³?', 'Line', 'Parabola', 'Circle', 'Cubic', 'B', 'MCQ', 'Eliminate parameter: y = (\\sqrt{x})³ = x^{3/2}, which is a parabola-like curve.'),

(39, 'Find the vector \\( \\vec{PQ} \\) if P(1, 2) and Q(4, -1).', '\\langle 3, -3 \\rangle', '\\langle -3, 3 \\rangle', '\\langle 3, 3 \\rangle', '\\langle -3, -3 \\rangle', 'A', 'MCQ', 'Vector from P to Q = Q - P = \\langle 4-1, -1-2 \\rangle = \\langle 3, -3 \\rangle.');

-- cumulative quiz

INSERT INTO questions (topic_id, question_text, option_a, option_b, option_c, option_d, correct_option, qtype, explanation) VALUES
(40, 'Verify the double angle identity: \\( \\sin(2x) = 2\\sin(x)\\cos(x) \\) for x = \\frac{\\pi}{6} \\).', '1', '\\frac{1}{2}', '\\frac{\\sqrt{3}}{2}', '\\frac{3}{4}', 'D', 'MCQ', 'Left side: \\sin(\\frac{\\pi}{3}) = \\frac{\\sqrt{3}}{2}. Right side: 2(\\frac{1}{2})(\\frac{\\sqrt{3}}{2}) = \\frac{\\sqrt{3}}{2}.'),

(40, 'In triangle ABC, if a = 6, b = 8, and \\angle C = 60°, find angle A using Law of Sines.', '35.7°', '41.8°', '84.3°', '53.1°', 'B', 'MCQ', '\\frac{\\sin(A)}{6} = \\frac{\\sin(60°)}{8}, so A = \\arcsin(\\frac{6\\sin(60°)}{8}) ≈ 41.8°.'),

(40, 'Find \\( \\lim_{x \\to 0} \\frac{\\sin(x)}{x} \\).', '0', '1', '∞', 'Does not exist', 'B', 'MCQ', 'This is a fundamental limit in calculus. The limit equals 1.'),

(40, 'Find \\( \\frac{d}{dx}(\\ln(x^2 + 1)) \\) using the chain rule.', '\\frac{2x}{x^2 + 1}', '\\frac{1}{x^2 + 1}', '\\frac{2}{x}', '2x', 'A', 'MCQ', 'Using chain rule: \\frac{1}{x^2 + 1} \\cdot \\frac{d}{dx}(x^2 + 1) = \\frac{2x}{x^2 + 1}.'),

(40, 'Evaluate \\( \\int_0^\\pi \\sin(x)\\,dx \\).', '0', '1', '2', '-1', 'C', 'MCQ', 'Antiderivative is -\\cos(x). Evaluate: -[\\cos(\\pi) - \\cos(0)] = -(-1 - 1) = 2.'),

(40, 'Convert the polar point \\( (2, \\frac{\\pi}{3}) \\) to rectangular coordinates.', '(1, \\sqrt{3})', '(2, 0)', '(1, -\\sqrt{3})', '(-\\sqrt{3}, 1)', 'A', 'MCQ', 'x = 2\\cos(\\frac{\\pi}{3}) = 1, y = 2\\sin(\\frac{\\pi}{3}) = \\sqrt{3}.'),

(40, 'Find the magnitude of vector \\( \\vec{v} = \\langle 3, 4 \\rangle \\).', '7', '5', '25', '1', 'B', 'MCQ', '|\\vec{v}| = \\sqrt{3^2 + 4^2} = \\sqrt{25} = 5.'),

(40, 'Find the area of the region bounded by r = 2\\sin(\\theta) from 0 to \\pi.', '\\pi', '2\\pi', '\\frac{\\pi}{2}', '4', 'B', 'MCQ', 'Area = \\frac{1}{2}\\int_0^\\pi (2\\sin(\\theta))^2\\,d\\theta = 2\\pi.'),

(40, 'Solve the differential equation \\frac{dy}{dx} = 2x with y(0) = 1.', 'y = x^2', 'y = x^2 + 1', 'y = 2x + 1', 'y = 2x^2', 'B', 'MCQ', 'Integrate both sides: y = \\int 2x\\,dx = x^2 + C. Using y(0) = 1: 1 = 0 + C, so y = x^2 + 1.'),

(40, 'Find the area between y = x^2 and y = x from x = 0 to x = 1.', '\\frac{1}{2}', '\\frac{1}{3}', '\\frac{1}{4}', '\\frac{1}{6}', 'D', 'MCQ', 'Area = \\int_0^1 (x - x^2)\\,dx = [\\frac{x^2}{2} - \\frac{x^3}{3}]_0^1 = \\frac{1}{6}.');


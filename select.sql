-- Active: 1747547635271@@127.0.0.1@5432@ms
-- Create the 'students' table with necessary fields
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);


-- Insert sample data for students

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
    ('Mohammad', 'Sumon', 23, 'A', 'Computer Science', 'sumon.m@example.com', '2001-01-12', 'O+', 'Bangladesh'),
    ('Shibly', 'Mahadi', 22, 'B', 'Physics', 'shibly.m@example.com', '2002-03-24', 'A-', 'Bangladesh'),
    ('Asif', 'Khan', 21, 'C', 'Math', 'asif.khan@example.com', '2003-06-10', 'B+', 'Bangladesh'),
    ('Naimah', 'Salsabil', 20, 'A', 'Biology', 'naimah.s@example.com', '2004-09-17', 'AB+', 'Bangladesh'),
    ('Tanvir', 'Hasan', 22, 'B', 'History', 'tanvir.h@example.com', '2002-12-02', 'A+', 'Bangladesh'),
    ('Farzana', 'Akter', 23, 'A', 'English', 'farzana.a@example.com', '2001-08-11', 'B-', 'Bangladesh'),
    ('Rakibul', 'Islam', 24, 'C', 'Chemistry', NULL, '2000-05-29', 'O-', 'Bangladesh'),
    ('Nusrat', 'Jahan', 21, 'B', 'Computer Science', 'nusrat.j@example.com', '2003-10-08', 'A-', 'Bangladesh'),
    ('Reza', 'Rahman', 20, 'A', 'Physics', 'reza.r@example.com', '2004-02-22', 'AB-', 'Bangladesh'),
    ('Tahsin', 'Ahmed', 19, 'B', 'Math', 'tahsin.ahmed@example.com', '2005-01-30', 'B+', 'Bangladesh');


-- Show all student table
SELECT * FROM students;

-- Insert sample data for students
INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
    ('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-01-15', 'O+', 'USA'),
    ('Jane', 'Smith', 21, 'B', 'History', 'jane.smith@example.com', '2003-05-20', 'A-', 'Canada'),
    ('Alice', 'Johnson', 19, 'A', 'Physics', 'alice.johnson@example.com', '2002-11-08', 'B+', 'UK'),
    ('Bob', 'Williams', 22, 'C', 'Chemistry', 'bob.williams@example.com', '2001-07-03', 'AB-', 'Australia'),
    ('Charlie', 'Brown', 20, 'B', 'English', NULL, '2004-03-30', 'A+', 'New Zealand'),
    ('Emman', 'Jones', 23, 'B', 'Biology', 'emma.jones@example.com', '2000-09-12', 'A-', 'USA'),
    ('Michael', 'Johnson', 22, 'C', 'Physics', 'michael.johnson@example.com', '2002-04-05', 'O-', 'Canada'),
    ('Olivia', 'Davis', 21, 'A', 'Math', 'olivia.davis@example.com', '2003-12-18', 'B-', 'UK'),
    ('William', 'Taylor', 20, 'B', 'Chemistry', NULL, '2004-08-30', 'A+', 'Australia'),
    ('Sophia', 'Brown', 24, 'A', 'English', 'sophia.brown@example.com', '1999-06-25', 'AB+', 'New Zealand'),
    ('Liam', 'Miller', 19, 'C', 'History', 'liam.miller@example.com', '2002-02-10', 'A-', 'USA'),
    ('Ava', 'Anderson', 22, 'B', 'Biology', 'ava.anderson@example.com', '2000-11-15', 'B+', 'Canada'),
    ('Noah', 'Martinez', 21, 'A', 'Physics', NULL, '2001-04-28', 'O+', 'UK'),
    ('Isabella', 'Clark', 20, 'C', 'Chemistry', 'isabella.clark@example.com', '2003-10-03', 'A-', 'Australia'),
    ('Ethan', 'Garcia', 23, 'B', 'Math', 'ethan.garcia@example.com', '2000-07-22', 'B-', 'New Zealand'),
    ('Sophie', 'Moore', 22, 'A', 'English', 'sophie.moore@example.com', '2002-12-05', 'A+', 'USA'),
    ('Mia', 'Hernandez', 20, 'C', 'History', 'mia.hernandez@example.com', '2004-05-18', 'AB-', 'Canada'),
    ('James', 'Young', 21, 'B', 'Biology', 'james.young@example.com', '2003-02-08', 'O-', 'UK'),
    ('Emma', 'Gonzalez', 24, 'A', 'Physics', NULL, '1999-09-30', 'B+', 'Australia'),
    ('Miam', 'Wright', 19, 'C', 'Math', 'liam.wright@example.com', '2002-06-14', 'A+', 'New Zealand');

-- Sort students by birth date (latest to earliest)
SELECT * FROM students ORDER BY dob DESC;

-- Sort students by birth date (earliest to latest)
SELECT * FROM students ORDER BY dob ASC;

-- Get all unique blood groups

SELECT DISTINCT blood_group from students;

-- Select students from USA or Australia aged 20
SELECT * from students
    WHERE (country = 'USA' OR country = 'Australia') and age = 20;

-- Select students from Bangladesh aged 20 or older
SELECT * from students
    WHERE (country = 'Bangladesh') and age >= 20;

-- Select students not from the USA
SELECT * from students
    WHERE country <> 'USA' ;

-- Sort first names by length (ascending)
SELECT first_name, length(first_name) from students ORDER BY length(first_name) ASC;
-- Sort last names by length (descending)
SELECT last_name, length(last_name) from students ORDER BY length(last_name) DESC;

-- Count total number of students
SELECT count(*) from students;

-- Count total number of students with label
SELECT 'Total = ' || COUNT(*) AS total_students
FROM students;

-- Get the max length of first names
SELECT max(length(first_name)) from students;

-- Get the max length of first names
SELECT MAX(LENGTH(first_name)) AS max_name_length FROM students;

-- Get students with the longest first name(s)
SELECT first_name, last_name, LENGTH(first_name) AS name_length
FROM students
WHERE LENGTH(first_name) = (
    SELECT MAX(LENGTH(first_name)) FROM students
);

SELECT * from students
    WHERE NOT country = 'USA' ;

-- Find students with NULL emails
SELECT * from students 
    WHERE email IS NOT NULL;

select COALESCE(email, 'Email not provided') as "Email", blood_group, first_name from students;


-- Show students grouped by country
SELECT country, COUNT(*) AS students_count
FROM students
GROUP BY country;


-- Get the oldest student(s)
SELECT * FROM students
WHERE dob = (SELECT MIN(dob) FROM students);


-- Select students who are older than 22
SELECT * FROM students
WHERE age > 22;


-- Select students with blood group 'A+' or 'B+'
SELECT * FROM students
WHERE blood_group IN ('A+', 'B+');


-- Select students whose names start with 'M'
SELECT * FROM students
WHERE first_name LIKE 'M%';

-- Select students whose last name ends with 'n'
SELECT * FROM students
WHERE last_name LIKE '%n';


-- Select students whose course name contains 'Math'
SELECT * FROM students
WHERE course ILIKE '%math%';

-- Select students born before the year 2002
SELECT * FROM students
WHERE dob < '2002-01-01';

-- Select students born between 2001 and 2003
SELECT * FROM students
WHERE dob BETWEEN '2001-01-01' AND '2003-12-31';




-- Show students and label them based on grade
SELECT first_name, grade,
    CASE 
        WHEN grade = 'A' THEN 'Excellent'
        WHEN grade = 'B' THEN 'Good'
        WHEN grade = 'C' THEN 'Needs Improvement'
        ELSE 'Unknown'
    END AS grade_status
FROM students;
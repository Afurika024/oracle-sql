# School Management System

# Overview

The School Management System is a streamlined application focused on managing the core elements of an educational institution: teachers, students, and classes. This system helps track student enrollments in classes, manage teacher assignments, and facilitate academic administration.
Features
Teacher Management: Maintain records of teachers, including their assigned classes.
Student Management: Track student information and their class enrollments.
Class Management: Create and manage classes, associating them with teachers and students.
Technologies Used
Database: Oracle Database
SQL: Structured Query Language for data manipulation and retrieval
Database Design
Conceptual Diagram
The database consists of the following tables and their relationships:

## 1.Teachers

Attributes: TeacherID (PK), TeacherName

## 2.Classes

Attributes: ClassID (PK), ClassName, TeacherID (FK)
Relationship: Each class is taught by one teacher (One-to-Many).

## 3.Students

Attributes: StudentID (PK), StudentName
Relationship: Each student can enroll in multiple classes (Many-to-Many).
SQL Tables

The following SQL commands create the necessary tables:
### Create Teachers Table
```SQL

CREATE TABLE Teachers (
    TeacherID NUMBER PRIMARY KEY,
    TeacherName VARCHAR2(100) NOT NULL
);
```

### Create Classes Table
```SQL
CREATE TABLE Classes (
    ClassID NUMBER PRIMARY KEY,
    ClassName VARCHAR2(100) NOT NULL,
    TeacherID NUMBER,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
```

### Create Students Table
```SQL
CREATE TABLE Students (
    StudentID NUMBER PRIMARY KEY,
    StudentName VARCHAR2(100) NOT NULL
);
```
### Operations
Basic SQL Commands
Insert Data: Add new records to the tables.
Update Data: Modify existing records.
Delete Data: Remove records from the tables.
Select Data: Retrieve information from the database.
DATA MANIPULATION

### INSERTION

```SQL
INSERT INTO Teachers (teacher_id, name, subject) VALUES (1, 'Mr. Afurika', 'Math');
INSERT INTO Teachers (teacher_id, name, subject) VALUES (2, 'Ms. kylie', 'Science');

INSERT INTO Classes (class_id, class_name, teacher_id) VALUES (1, 'Math 101', 1);
INSERT INTO Classes (class_id, class_name, teacher_id) VALUES (2, 'Science 101', 2);

INSERT INTO Students (student_id, name, age, class_id) VALUES (1, 'Kobe', 10, 1);
INSERT INTO Students (student_id, name, age, class_id) VALUES (2, 'Gianna', 11, 1);
INSERT INTO Students (student_id, name, age, class_id) VALUES (3, 'Bryant', 12, 2);
```

### UPDATE
```SQL
UPDATE Students SET name = 'Alicia' WHERE student_id = 1;
UPDATE Teachers SET subject = 'Advanced Math' WHERE teacher_id = 1;
```


### DELETE DATA

```SQL
DELETE FROM Students WHERE student_id = 3;
DELETE FROM Classes WHERE class_id = 2;
```

### ALTER TABLE Teachers

```SQL
ADD CONSTRAINT unique_teacher_name UNIQUE (TeacherName);
ALTER TABLE Teachers
MODIFY TeacherName VARCHAR2(150);
```


### QUERYING OF DATA

```SQL
SELECT c.class_name, t.name AS teacher_name
FROM Classes c
JOIN Teachers t ON c.teacher_id = t.teacher_id;

SELECT s.name AS student_name, c.class_name
FROM Students s
JOIN Classes c ON s.class_id = c.class_id;


SELECT t.name, COUNT(c.class_id) AS class_count
FROM Teachers t
JOIN Classes c ON t.teacher_id = c.teacher_id
GROUP BY t.name
HAVING COUNT(c.class_id) > 1;
```

### TRANSACTION CONTROL

```SQL
UPDATE Teachers SET TeacherName = 'Alice Smith' WHERE TeacherID = 1;
ROLLBACK;

INSERT INTO Classes (ClassID, ClassName, TeacherID) VALUES (3, 'History', 1);
SAVEPOINT before_student_insert; 
INSERT INTO Students (StudentID, StudentName) VALUES (4, 'Emily Davis');
ROLLBACK TO before_student_insert;
COMMIT;
```


# Key Components

## Students Table
 1.Purpose: To store information about each student enrolled in the school.

2.Attributes:
   StudentID: A unique identifier for each student, allowing for easy tracking and management.
   StudentName: The name of the student, which is essential for records and communication.

## Teachers Table
1.Purpose: To manage details about teachers employed at the institution.

2.Attributes:
   TeacherID: A unique identifier for each teacher, ensuring accurate record-keeping.
   TeacherName: The name of the teacher, which is important for class assignments and communication with students and parents.

## Classes Table
1.Purpose: To manage information about the classes offered by the school.

2.Attributes:
   ClassID: A unique identifier for each class, making it easier to manage scheduling and enrollments.
   ClassName: The name of the class, which helps in identifying and referencing the class within the system.
   TeacherID: A foreign key linking the class to the teacher responsible for it, facilitating management of teacher assignments.

## Relationships
### Students and Classes:

Many-to-Many Relationship:

A student can enroll in multiple classes (e.g., Mathematics, Science), and each class can have multiple students.
This relationship can be managed with an additional Enrollments table, which links students to their respective classes.

### Classes and Teachers:
One-to-Many Relationship:

Each class is taught by one teacher, but a teacher can teach multiple classes. This structure allows for clear accountability and management of teaching assignments.

### Functionalities
Enrollment Management:

oEnroll students in classes, ensuring they can take the subjects they need for their education.

### 1.Class Management:

Create, update, and delete classes as needed, assigning teachers to specific classes.

## Teacher Management:

Maintain records of teachers, including their names and the classes they teach.

## Reporting:
oGenerate reports on student enrollments, teacher assignments, and class performance to assist with administrative decision-making.

Data Integrity:

Ensure that the data entered into the system is accurate and consistent,with relationships enforced through foreign keys.

### Benefits
Streamlined Administration: By centralizing all student, teacher, and class information, the system simplifies administrative tasks,reducing time and effort.

Improved Communication: Teachers can easily access class rosters and student information, facilitating better communication with students and parents.

Enhanced Tracking: The system allows for easy tracking of student enrollments in various classes, 
ensuring that academic records are maintained accurately.

Scalability: The design can be expanded to include additional features like grade management, attendance tracking, and scheduling, 
making it suitable for institutions of various sizes.


### Conclusion
The School Management System serves as a vital tool for educational institutions, facilitating effective management of students, teachers, 
and classes. By leveraging a structured database design, the system enhances operational efficiency, improves data management, 
and supports the overall educational mission.
 

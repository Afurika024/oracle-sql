INSERT INTO Teachers (teacher_id, name, subject) VALUES (1, 'Mr. Afurika', 'Math');
INSERT INTO Teachers (teacher_id, name, subject) VALUES (2, 'Ms. kylie', 'Science');

INSERT INTO Classes (class_id, class_name, teacher_id) VALUES (1, 'Math 101', 1);
INSERT INTO Classes (class_id, class_name, teacher_id) VALUES (2, 'Science 101', 2);

INSERT INTO Students (student_id, name, age, class_id) VALUES (1, 'Kobe', 10, 1);
INSERT INTO Students (student_id, name, age, class_id) VALUES (2, 'Gianna', 11, 1);
INSERT INTO Students (student_id, name, age, class_id) VALUES (3, 'Bryant', 12, 2);



UPDATE Students SET name = 'Alicia' WHERE student_id = 1;

UPDATE Teachers SET subject = 'Advanced Math' WHERE teacher_id = 1;

DELETE FROM Students WHERE student_id = 3;
DELETE FROM Classes WHERE class_id = 2;

ALTER TABLE Teachers
ADD CONSTRAINT unique_teacher_name UNIQUE (TeacherName);
ALTER TABLE Teachers
MODIFY TeacherName VARCHAR2(150);




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

INSERT INTO Students (StudentID, StudentName) VALUES (3, 'Michael Johnson');
COMMIT;

UPDATE Teachers SET TeacherName = 'Alice Smith' WHERE TeacherID = 1;
ROLLBACK;

INSERT INTO Classes (ClassID, ClassName, TeacherID) VALUES (3, 'History', 1);
SAVEPOINT before_student_insert; 
INSERT INTO Students (StudentID, StudentName) VALUES (4, 'Emily Davis');
ROLLBACK TO before_student_insert;
COMMIT;
CREATE TABLE Enrollments (
    EnrollmentID NUMBER PRIMARY KEY,
    StudentID NUMBER,
    ClassID NUMBER,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID));


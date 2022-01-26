CREATE DATABASE IF NOT EXISTS accounting_for_programming_courses;
USE accounting_for_programming_courses;

# создание таблиц
CREATE TABLE students(
id INT(11) NOT NULL AUTO_INCREMENT,
student VARCHAR(40) NOT NULL,
PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE groups_student(
id INT(11) NOT NULL AUTO_INCREMENT,
group_of VARCHAR(10) NOT NULL,
PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE lessons_topics(
id INT(11) NOT NULL AUTO_INCREMENT,
learning_topics VARCHAR(30) NOT NULL,
PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE lessons_plan(
id INT(11) NOT NULL AUTO_INCREMENT,
plan VARCHAR(200) NOT NULL,
PRIMARY KEY(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE course(
id INT(11) NOT NULL AUTO_INCREMENT,
lesson_time DATETIME(4),
group_ID INT(10) NOT NULL,
student_id INT(10) NOT NULL,
topic_id INT(10) NOT NULL,
plan_id INT(10) NOT NULL,
PRIMARY KEY(id),
KEY FK_group_idx (group_id),
KEY FK_student_idx (student_id),
KEY FK_topic_idx (topic_id),
KEY FK_plan_idx (plan_id),
CONSTRAINT FK_group_id FOREIGN KEY (group_id) REFERENCES groups_student (id) ON UPDATE CASCADE,
CONSTRAINT FK_student_id FOREIGN KEY (student_id) REFERENCES students (id) ON UPDATE CASCADE,
CONSTRAINT FK_topic_id FOREIGN KEY (topic_id) REFERENCES lessons_topics (id) ON UPDATE CASCADE,
CONSTRAINT FK_plan_id FOREIGN KEY (plan_id) REFERENCES lessons_plan (id) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# add record in table student
INSERT INTO students (student) VALUES ('Юсупов Ильгиз Русланович');
INSERT INTO students (student) VALUES ('Омурбекова Мээрим Эрмековна');
INSERT INTO students (student) VALUES ('Кыйшыбеков Мурат Маратович');
INSERT INTO students (student) VALUES ('Мусабаева Айсалкын Маратовна');
INSERT INTO students (student) VALUES ('Мирбек кызы Айдай');

# add record in table group
INSERT INTO groups_student (group_of) VALUES ('ПМИ 1 - 14');
INSERT INTO groups_student (group_of) VALUES ('ПИ 1 - 14');

# add record in table lessons_topics
INSERT INTO lessons_topics (learning_topics) VALUES ('Дискретная математика');
INSERT INTO lessons_topics (learning_topics) VALUES ('Теория вероятностей');
INSERT INTO lessons_topics (learning_topics) VALUES ('Высшая математика');
INSERT INTO lessons_topics (learning_topics) VALUES ('Исскуственный интеллект');
INSERT INTO lessons_topics (learning_topics) VALUES ('Машиностроение');

# add record in table lessons_plan
INSERT INTO lessons_plan (plan) VALUES ('8.00 - Дискр. математика
 9.00 - ВЫсшая математика 
 10.00 - Дискретная математика');
 INSERT INTO lessons_plan (plan) VALUES ('8.00 - Теория вероятностей');


# add record in table course
#record 1
INSERT INTO course (lesson_time, group_id, student_id, topic_id, plan_id)
VALUES ('2022-01-10 08:00', 
(SELECT id FROM groups_student where id=1),
(SELECT id FROM students  where id=1),
(SELECT id FROM lessons_topics where id=1),
(SELECT id FROM lessons_plan where id=1));

INSERT INTO course (lesson_time, group_id, student_id, topic_id, plan_id)
VALUES ('2022-01-10 08:00', 
(SELECT id FROM groups_student where id=1),
(SELECT id FROM students  where id=2),
(SELECT id FROM lessons_topics where id=1),
(SELECT id FROM lessons_plan where id=2));

INSERT INTO course (lesson_time, group_id, student_id, topic_id, plan_id)
VALUES ('2022-01-10 09:00', 
(SELECT id FROM groups_student where id=2),
(SELECT id FROM students  where id=3),
(SELECT id FROM lessons_topics where id=5),
(SELECT id FROM lessons_plan where id=1));

INSERT INTO course (lesson_time, group_id, student_id, topic_id, plan_id)
VALUES ('2022-01-10 12:00', 
(SELECT id FROM groups_student where id=1),
(SELECT id FROM students  where id=2),
(SELECT id FROM lessons_topics where id=1),
(SELECT id FROM lessons_plan where id=2));
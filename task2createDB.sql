CREATE DATABASE IF NOT EXISTS human_resources_departmentDB;
USE human_resources_departmentDB;
# создание таблиц
CREATE TABLE departments(
  id int(11) NOT NULL AUTO_INCREMENT,
  description varchar(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE employees(
  id int(11) NOT NULL AUTO_INCREMENT,
  fullname varchar(40) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE boss (
  id int(11) NOT NULL AUTO_INCREMENT,
  fullname varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE position (
  id int(11) NOT NULL AUTO_INCREMENT,
  speciality varchar(45) NOT NULL,
  salary double (12,3) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE rotation (
  id int(11) NOT NULL AUTO_INCREMENT,
  time datetime(6) NOT NULL,
  employes_id int(11) NOT NULL,
  position_id int(11) NOT NULL,
  department_id int(11) NOT NULL,
  boss_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY FK_employes_idx (employes_id),
  KEY FK_position_idx (position_id),
  KEY FK_department_idx (department_id),
  KEY FK_boss_idx (boss_id),
  CONSTRAINT FK_employes FOREIGN KEY (employes_id) REFERENCES employees (id) ON UPDATE CASCADE,
  CONSTRAINT FK_position FOREIGN KEY (position_id) REFERENCES position (id) ON UPDATE CASCADE,
  CONSTRAINT FK_department FOREIGN KEY (department_id) REFERENCES departments (id) ON UPDATE CASCADE,
  CONSTRAINT FK_boss FOREIGN KEY (boss_id) REFERENCES boss (id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#add record in table departments
INSERT INTO departments (description) VALUES ('Отдел эксплуатации автоматизированных систем');
INSERT INTO departments (description) VALUES ('Отдел информационных систем');
INSERT INTO departments (description) VALUES ('Отдел радиотехнического обеспечения');

#add record in table boss
INSERT INTO boss (fullname) VALUES ('Иванов Иван Октябрьевич');
INSERT INTO boss (fullname) VALUES ('Калыбеков Бектур Ормонович');
INSERT INTO boss (fullname) VALUES ('Югай Нигара Шамзудовна');

#add record in table position
INSERT INTO position (speciality,salary) VALUES ('инженер-программист','54466.66');
INSERT INTO position (speciality,salary) VALUES ('главный инженер-программист','85962.45');
INSERT INTO position (speciality,salary) VALUES ('техник','29056.25');

#add record in table employees
INSERT INTO employees (fullname) VALUES ('Токонов Атай Маратович');
INSERT INTO employees (fullname) VALUES ('Джек Мартин-Фредериска');
INSERT INTO employees (fullname) VALUES ('Югай Юлия Шахутдинова');
INSERT INTO employees (fullname) VALUES ('Галактика Марсина Юпитеровна ');
INSERT INTO employees (fullname) VALUES ('Маратов Айдар Маратович');

#add record in table rotation
#record1
INSERT INTO rotation (time, employes_id,position_id,department_id,boss_id)
VALUES ('2017-12-12 15:41', 
(SELECT id FROM employees where id=1),
(SELECT id FROM position  where id=3),
(SELECT id FROM departments where id=3),
(SELECT id FROM boss where id=3));

#record2
INSERT INTO rotation (time, employes_id,position_id,department_id,boss_id)
VALUES ('2021-04-30 16:00', 
(SELECT id FROM employees where id=4),
(SELECT id FROM position  where id=1),
(SELECT id FROM departments where id=2),
(SELECT id FROM boss where id=3));

#record3
INSERT INTO rotation (time, employes_id,position_id,department_id,boss_id)
VALUES ('2022-01-26 08:00', 
(SELECT id FROM employees where id=3),
(SELECT id FROM position  where id=1),
(SELECT id FROM departments where id=1),
(SELECT id FROM boss where id=1));
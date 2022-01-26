CREATE DATABASE IF NOT EXISTS lybrary_referenceDB;
USE lybrary_referenceDB;
# создание таблиц
CREATE TABLE subordinate_categories_fiction(
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE subordinate_categories_fizika (
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE subordinate_categories_mehanika (
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE subordinate_categories_tech_literature (
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE subordinate_categories_fantazy (
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE categories_janr (
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL DEFAULT 'name category',
  fizika_id int(11) DEFAULT NULL,
  mehanika_id int(11) DEFAULT NULL,
  fiction_literature_id int(11) DEFAULT NULL,
  tech_literature_id int(11) DEFAULT NULL,
  fantazy_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_fizika_idx (fizika_id),
  KEY FK_mehanika_idx (mehanika_id),
  KEY FK_fiction_literature_idx (fiction_literature_id),
  KEY FK_tech_literature_idx (tech_literature_id),
  KEY FK_fantazy_idx (fantazy_id ),
  CONSTRAINT FK_subordinate_categories_fizika FOREIGN KEY (fizika_id) REFERENCES subordinate_categories_fizika (id) ON UPDATE CASCADE,
  CONSTRAINT FK_subordinate_categories_mehanika FOREIGN KEY (mehanika_id) REFERENCES subordinate_categories_mehanika (id) ON UPDATE CASCADE,
  CONSTRAINT FK_subordinate_categories_fiction FOREIGN KEY (fiction_literature_id) REFERENCES subordinate_categories_fiction (id) ON UPDATE CASCADE,
  CONSTRAINT FK_subordinate_categories_tech_literature FOREIGN KEY (tech_literature_id) REFERENCES subordinate_categories_tech_literature (id) ON UPDATE CASCADE,
  CONSTRAINT FK_subordinate_categories_fantazy FOREIGN KEY (fantazy_id) REFERENCES subordinate_categories_fantazy (id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE categories_type (
  id int(11) NOT NULL AUTO_INCREMENT,
  category varchar(45) NOT NULL DEFAULT 'name category',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE literaturies (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(45) NOT NULL,
  description varchar(500) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE writers (
  id int(11) NOT NULL AUTO_INCREMENT,
  fullname varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE lybrary_literaturies (
  id int(11) NOT NULL AUTO_INCREMENT,
  literature_id int (11) NOT NULL,
  writer_id int(11) DEFAULT NULL,
  categories_type_id int(11) DEFAULT NULL,
  categories_janr_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK_literature_idx (literature_id),
  KEY FK_writer_idx (writer_id),
  KEY FK_category_type_idx (categories_type_id),
  KEY FK_categories_janr_idx (categories_janr_id),
  CONSTRAINT FK_literature FOREIGN KEY (literature_id) REFERENCES literaturies (id) ON UPDATE CASCADE,
  CONSTRAINT FK_writer FOREIGN KEY (writer_id) REFERENCES writers (id) ON UPDATE CASCADE,
  CONSTRAINT FK_categories_type FOREIGN KEY (categories_type_id) REFERENCES categories_type (id) ON UPDATE CASCADE,
  CONSTRAINT FK_categories_janr FOREIGN KEY (categories_janr_id) REFERENCES categories_janr (id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# add title in table subordinate_categoies_type
INSERT INTO subordinate_categories_fiction (category) VALUES ('Золтой век');
INSERT INTO subordinate_categories_fiction (category) VALUES ('Серебрянный век');
INSERT INTO subordinate_categories_fiction (category) VALUES ('Бронзовый век');

INSERT INTO subordinate_categories_fizika (category) VALUES ('Механика');
INSERT INTO subordinate_categories_fizika (category) VALUES ('Термодинамика');
INSERT INTO subordinate_categories_fizika (category) VALUES ('Электромагнетизм');
INSERT INTO subordinate_categories_fizika (category) VALUES ('Статистическая физика,');
INSERT INTO subordinate_categories_fizika (category) VALUES ('Квантовая механика');
INSERT INTO subordinate_categories_fizika (category) VALUES ('Теория относительности');


INSERT INTO subordinate_categories_mehanika (category) VALUES ('Статистика');
INSERT INTO subordinate_categories_mehanika (category) VALUES ('Кинематика');
INSERT INTO subordinate_categories_mehanika (category) VALUES ('Динамика');

INSERT INTO subordinate_categories_tech_literature (category) VALUES ('Машиностроение');
INSERT INTO subordinate_categories_tech_literature (category) VALUES ('Диагностика');
INSERT INTO subordinate_categories_tech_literature (category) VALUES ('Электроприборы');

INSERT INTO subordinate_categories_fantazy (category) VALUES ('Мистика');
INSERT INTO subordinate_categories_fantazy (category) VALUES ('Фантастика');
INSERT INTO subordinate_categories_fantazy (category) VALUES ('Фэнтези');

# add title in table categoies_type
INSERT INTO  categories_type (category) VALUES ('Статья');
INSERT INTO  categories_type (category) VALUES ('Учебник');
INSERT INTO  categories_type (category) VALUES ('Справочник');
INSERT INTO  categories_type (category) VALUES ('Повесть');
INSERT INTO  categories_type (category) VALUES ('Роман');

# add title in table literature
INSERT INTO  literaturies (title,description) VALUES ('Граф Монте-Кристо','Эдмон Дантес (граф Монте-Кристо) — главный герой, моряк, несправедливо заключённый в тюрьму. Также использовал имена и личины аббат Бузони, лорд Уилмор, мальтиец Дзакконе, Синдбад-Мореход. Аббат Фариа — товарищ Эдмона Дантеса по заключению, учёный монах, открывший ему тайну клада на острове Монте-Кристо.');
INSERT INTO  literaturies (title,description) VALUES ('Записки о Шерлоке Холмсе','«Записки о Шерлоке Холмсе» - сюжет Вся Англия обсуждает трагедию, случившуюся в конюшнях Кингс-Пайленда: буквально накануне скачек за кубок Уэссекса пропал главный фаворит соревнований — жеребец по кличке Серебряный — и был убит его тренер Джон Стрэкер. Холмс вместе с Ватсоном выезжает на место преступления...');
INSERT INTO  literaturies (title) VALUES ('Большая книга проектов Python');
INSERT INTO  literaturies (title,description) VALUES ('Три мушкетера','историко-приключенческий роман Александра Дюма-отца, впервые опубликованный в парижской газете Le Siècle');

# add title in table writers
INSERT INTO  writers (fullname) VALUES ('Александр Дюма');
INSERT INTO  writers (fullname) VALUES ('Артур Конан-Дойл');

# add title in table categories_janr
# janr 1
INSERT INTO categories_janr (category, fiction_literature_id)
VALUES ('Художественная литература', 
(SELECT id FROM subordinate_categories_fiction where category='Золтой век'));

# janr 2
INSERT INTO categories_janr (category, tech_literature_id)
VALUES ('Техническая литература', 
(SELECT id FROM subordinate_categories_tech_literature where category='Машиностроение'));

# add lybryri literatures
# literature 1
INSERT INTO lybrary_literaturies (literature_id, writer_id, categories_type_id, categories_janr_id)
VALUES ( 
(SELECT id FROM literaturies where title='Граф Монте-Кристо'),
(SELECT id FROM writers where fullname='Александр Дюма'),
(SELECT id FROM categories_type where category='Роман'),
(SELECT id FROM categories_janr where category='Художественная литература'));

# literature 2
INSERT INTO lybrary_literaturies (literature_id, writer_id, categories_type_id, categories_janr_id)
VALUES ( 
(SELECT id FROM literaturies where title='Три мушкетера'),
(SELECT id FROM writers where fullname='Александр Дюма'),
(SELECT id FROM categories_type where category='Роман'),
(SELECT id FROM categories_janr where category='Художественная литература'));

# literature 3
INSERT INTO lybrary_literaturies (literature_id, writer_id, categories_type_id, categories_janr_id)
VALUES ( 
(SELECT id FROM literaturies where title='Записки о Шерлоке Холмсе'),
(SELECT id FROM writers where fullname='Артур Конан-Дойл'),
(SELECT id FROM categories_type where category='Роман'),
(SELECT id FROM categories_janr where category='Художественная литература'));

# literature 4
INSERT INTO lybrary_literaturies (literature_id, categories_type_id, categories_janr_id)
VALUES ( 
(SELECT id FROM literaturies where title='Большая книга проектов Python'),
(SELECT id FROM categories_type where category='Учебник'),
(SELECT id FROM categories_janr where category='Техническая литература'));
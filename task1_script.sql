# Какие произведения написал писатель
select
writers.fullname,
literaturies.title,
literaturies.description
from lybrary_literaturies
inner join writers on lybrary_literaturies.writer_id=writers.id
inner join literaturies on lybrary_literaturies.literature_id=literaturies.id
where  writers.id = 1;

#Какие произведения входят в указанную категории
select
literaturies.title,
literaturies.description,
categories_type.category
from lybrary_literaturies
inner join categories_type on lybrary_literaturies.categories_type_id=categories_type.id
inner join literaturies on lybrary_literaturies.literature_id=literaturies.id
where  categories_type.category = 'Учебник';

#Кто автор или авторы указанного произведения
select
writers.fullname,
literaturies.title,
literaturies.description
from lybrary_literaturies
inner join writers on lybrary_literaturies.writer_id=writers.id
inner join literaturies on lybrary_literaturies.literature_id=literaturies.id
where  literaturies.title = 'Граф Монте-Кристо';

# В каких жанрах писатель создавал произведения? 
select
writers.fullname,
categories_janr.category
from lybrary_literaturies
inner join writers on lybrary_literaturies.writer_id=writers.id
inner join categories_janr on lybrary_literaturies.categories_janr_id= categories_janr.id
where  writers.id = 2;

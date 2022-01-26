#В каком отделе работал указанный сотрудник на указанную дату
select
employees.employee,
departments.department,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
where employees.id = 1 and date(rotation.time) = '2017-12-12';

#Какую должность занимал указанный сотрудник на указанную дату
select
employees.employee,
departments.department,
position.speciality,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
inner join position on rotation.position_id = position.id
where date(rotation.time) = '2021-01-15' and employees.id = 4;

#Какой оклад был назначен указанному сотруднику на указанную дату?
select
employees.employee,
departments.department,
position.speciality,
position.salary,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
inner join position on rotation.position_id = position.id
where date(rotation.time) = '2021-04-30' and employees.id = 4;

#Кому был подчинен указанный сотрудник на указанную дату?
select
employees.employee,
departments.department,
rotation.time,
boss.boss
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
inner join position on rotation.position_id = position.id
inner join boss on rotation.boss_id = boss.id
where date(rotation.time) = '2022-01-26' and employees.id = 3;

#Какие сотрудники были подчинены указанному сотруднику на указанную дату?
select
boss.boss,
employees.employee,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
inner join boss on rotation.boss_id = boss.id
where date(rotation.time) = '2022-01-26' and boss.id= 1;

# В каких отделах работал указанный сотрудник за указанный период дат? 
select
employees.employee,
departments.department,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
where date(rotation.time) between '2021-01-01' and '2021-05-30' and employees.id = 4;

# Какие должности занимал указанный сотрудник за указанный период дат?
select
employees.employee,
position.speciality,
departments.department,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
inner join position on rotation.position_id = position.id
where date(rotation.time) between '2021-01-01' and '2021-05-30' and employees.id = 4;

# Какой оклад был назначен указанному сотруднику за указанный период дат?
select
employees.employee,
position.speciality,
departments.department,
position.salary,
rotation.time
from rotation
inner join employees on rotation.employes_id = employees.id
inner join departments on rotation.department_id = departments.id
inner join position on rotation.position_id = position.id
where date(rotation.time) between '2021-01-01' and '2021-05-30' and employees.id = 4;

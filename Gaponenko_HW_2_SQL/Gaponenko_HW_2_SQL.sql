-- Создайте таблицы и наполните их как написано в этом документе
-- https://docs.google.com/document/d/1FbW6HRhK36-mjP8i9rCk1764koh1NuuwBhkBF6TJKXY/edit

-- 1) Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

-- 2) Наполнить таблицу employee 70 строками.

insert into employees(employee_name)
values ('Keira Westcott'),
	('Tatton Bourke'),
	('Kelda Paternoster'),
	('Cynthia Spurling'),
	('Lynne Vipond'),
	('Ry Brewer'),
	('Aileen Leon'),
	('Byron Augustine'),
	('Layla Langdon'),
	('Pippa Boon'),
	('Charity Winterbottom'),
	('Pamella Sexton'),
	('Elfreda Tennyson'),
	('Jadyn Christian'),
	('Ennis Underwood'),
	('Nick Siddall'),
	('Rusty Sanderson'),
	('Alyson Daniels'),
	('Shad Paternoster'),
	('Mercy Edison'),
	('Githa Darnell'),
	('Crawford Spooner'),
	('Dollie Batts'),
	('Berry Bain'),
	('Jarred Bennet'),
	('Meaghan Huff'),
	('Agnes Causer'),
	('Olive Banister'),
	('Jayden Steffen'),
	('Jerred Dexter'),
	('Dawn Roach'),
    ('Madlyn Willey'),
	('Dominick Bird'),
	('Steve Scrivener'),
	('Jaxon Newton'),
	('Rex Grenville'),
	('Aric Royceston'),
	('Shaun Albinson'),
	('Randolph Christinsen'),
	('Cree Randell'),
	('Peregrine Warren'),
	('Lyndi Jerome'),
	('Jonah Rome'),
	('Deloris Kay'),
	('Arnold Hudnall'),
	('Caryl Jeffery'),
	('Brock Abrahamson'),
	('Wystan Bolton'),
	('Stephen Ackerman'),
	('Friday Ayers'),
	('Frederick Pickle'),
	('Lorn Morris'),
	('Midge Eldridge'),
	('Lorene Timberlake'),
	('Alishia Spears'),
	('Freddy Allard'),
	('Axl Niles'),
	('Biddy Stanford'),
	('Dirk Banks'),
	('Laurencia Vernon'),
	('Daniella Harrison'),
	('Kipling Garrard'),
	('Roderick Terry'),
	('Elicia Walton'),
	('Sidney Abram'),
	('Zane Smythe'),
	('Ocean Rhodes'),
	('Edna Fitzroy'),
	('Pacey Earls'),
	('Helena Kay');

select * from employees;

-- 3) Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

-- 4) Наполнить таблицу salary 15 строками:

insert into salary(monthly_salary)
values (1000),
    (1100),
    (1200),
    (1300),
    (1400),
    (1500),
    (1600),
    (1700),
    (1800),
    (1900),
    (2000),
    (2100),
    (2200),
    (2300),
    (2400),
    (2500);

select * from salary;

-- 5) Cоздать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
    salary_id int not null
);

select * from employee_salary;

-- 6) Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id, salary_id)
values (1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 1),
	(18, 2),
	(19, 3),
	(20, 4),
	(21, 5),
	(22, 6),
	(23, 7),
	(24, 8),
	(25, 9),
	(26, 10),
	(27, 11),
	(28, 12),
	(29, 13),
	(30, 14),
	(71, 15),
	(72, 16),
	(73, 1),
	(74, 2),
	(75, 3),
	(76, 4),
	(77, 5),
	(78, 6),
	(79, 7),
	(80, 8);

select * from employee_salary;

-- 7) Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;

-- 8) Поменять тип столба role_name с int на varchar(30)

alter table roles
alter column role_name type varchar(30);

select * from roles;

-- 9) Наполнить таблицу roles 20 строками:

insert into roles(role_name)
values ('Junior Python developer'),
	('Middle Python developer'),
	('Senior Python developer'),
	('Junior Java developer'),
	('Middle Java developer'),
	('Senior Java developer'),
	('Junior JavaScript developer'),
	('Middle JavaScript developer'),
	('Senior JavaScript developer'),
	('Junior Manual QA engineer'),
	('Middle Manual QA engineer'),
	('Senior Manual QA engineer'),
	('Project Manager'),
	('Designer'),
	('HR'),
	('CEO'),
	('Sales manager'),
	('Junior Automation QA engineer'),
	('Middle Automation QA engineer'),
	('Senior Automation QA engineer');
		
select * from roles;

-- 10) Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
    role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);

select * from roles_employee;

-- 11) Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id, role_id)
values (31, 1),
	(32, 2),
	(33, 3),
	(34, 4),
	(35, 5),
	(36, 6),
	(37, 7),
	(38, 8),
	(39, 9),
	(40, 10),
	(41, 11),
	(42, 12),
	(43, 13),
	(44, 14),
	(45, 15),
	(46, 16),
	(47, 17),
	(48, 18),
	(49, 19),
	(50, 20),
	(51, 1),
	(52, 2),
	(53, 3),
	(54, 4),
	(55, 5),
	(56, 6),
	(57, 7),
	(58, 8),
	(59, 9),
	(60, 10),
	(61, 11),
	(62, 12),
	(63, 13),
	(64, 14),
	(65, 15),
	(66, 16),
	(67, 17),
	(68, 18),
	(69, 19),
	(70, 20);

select * from roles_employee;
-- Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )

 -- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employee_name, monthly_salary FROM employees E
join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id;

 -- 2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employee_name, monthly_salary FROM employees E
join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id
where monthly_salary < 2000;

 -- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT monthly_salary, employee_name FROM employees E
right join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id
where employee_name is null;

 -- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT monthly_salary, employee_name FROM employees E
right join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id
where employee_name is null and monthly_salary < 2000;

 -- 5. Найти всех работников кому не начислена ЗП.
SELECT employee_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
where monthly_salary is null;

 -- 6. Вывести всех работников с названиями их должности.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id;

 -- 7. Вывести имена и должность только Java разработчиков.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Java %';

 -- 8. Вывести имена и должность только Python разработчиков.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Python%';

 -- 9. Вывести имена и должность всех QA инженеров.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Manual QA%';

 -- 11. Вывести имена и должность автоматизаторов QA
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Automation QA%';

 -- 12. Вывести имена и зарплаты Junior специалистов
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Junior%';

 -- 13. Вывести имена и зарплаты Middle специалистов
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Middle%';

 -- 14. Вывести имена и зарплаты Senior специалистов
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Senior%';

 -- 15. Вывести зарплаты Java разработчиков
SELECT monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Java %';

 -- 16. Вывести зарплаты Python разработчиков
SELECT monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Python%';

 -- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Junior Python%';

 -- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Middle JavaScript%';

 -- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Senior Java %';

 -- 20. Вывести зарплаты Junior QA инженеров
SELECT monthly_salary, role_name FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%Junior%QA%';

 -- 21. Вывести среднюю зарплату всех Junior специалистов
SELECT AVG(monthly_salary) as AVG_SALARY_JUNIOR FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%Junior%';

 -- 22. Вывести сумму зарплат JS разработчиков
SELECT SUM(monthly_salary) as SUM_SALARY_JS FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%JavaScript%';

 -- 23. Вывести минимальную ЗП QA инженеров
SELECT MIN(monthly_salary) as MIN_SALARY_QA FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 24. Вывести максимальную ЗП QA инженеров
SELECT MAX(monthly_salary) as MAX_SALARY_QA FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 25. Вывести количество QA инженеров
SELECT COUNT(role_name) as QTY_QA FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 26. Вывести количество Middle специалистов.
SELECT COUNT(role_name) as QTY_MIDDLE FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%Middle%';


 -- 27. Вывести количество разработчиков
SELECT COUNT(role_name) as QTY_DEVS FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%developer%';

 -- 28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT SUM(monthly_salary) as SUM_SALARY_DEVS FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%developer%';

 -- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
order by monthly_salary;

 -- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

 -- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where monthly_salary < 2300
order by monthly_salary;

 -- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;
-- ���� ��� ������-�� ����� ���� ������� �������������� �������, ��������� � �������, �� ������� )

 -- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
SELECT employee_name, monthly_salary FROM employees E
join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id;

 -- 2. ������� ���� ���������� � ������� �� ������ 2000.
SELECT employee_name, monthly_salary FROM employees E
join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id
where monthly_salary < 2000;

 -- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
SELECT monthly_salary, employee_name FROM employees E
right join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id
where employee_name is null;

 -- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
SELECT monthly_salary, employee_name FROM employees E
right join employee_salary ES on ES.employee_id = E.id
join salary S on S.id = ES.salary_id
where employee_name is null and monthly_salary < 2000;

 -- 5. ����� ���� ���������� ���� �� ��������� ��.
SELECT employee_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
where monthly_salary is null;

 -- 6. ������� ���� ���������� � ���������� �� ���������.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id;

 -- 7. ������� ����� � ��������� ������ Java �������������.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Java %';

 -- 8. ������� ����� � ��������� ������ Python �������������.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Python%';

 -- 9. ������� ����� � ��������� ���� QA ���������.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 10. ������� ����� � ��������� ������ QA ���������.
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Manual QA%';

 -- 11. ������� ����� � ��������� ��������������� QA
SELECT employee_name, role_name FROM employees E
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Automation QA%';

 -- 12. ������� ����� � �������� Junior ������������
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Junior%';

 -- 13. ������� ����� � �������� Middle ������������
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Middle%';

 -- 14. ������� ����� � �������� Senior ������������
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Senior%';

 -- 15. ������� �������� Java �������������
SELECT monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Java %';

 -- 16. ������� �������� Python �������������
SELECT monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Python%';

 -- 17. ������� ����� � �������� Junior Python �������������
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Junior Python%';

 -- 18. ������� ����� � �������� Middle JS �������������
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Middle JavaScript%';

 -- 19. ������� ����� � �������� Senior Java �������������
SELECT employee_name, monthly_salary, role_name FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where role_name like '%Senior Java %';

 -- 20. ������� �������� Junior QA ���������
SELECT monthly_salary, role_name FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%Junior%QA%';

 -- 21. ������� ������� �������� ���� Junior ������������
SELECT AVG(monthly_salary) as AVG_SALARY_JUNIOR FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%Junior%';

 -- 22. ������� ����� ������� JS �������������
SELECT SUM(monthly_salary) as SUM_SALARY_JS FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%JavaScript%';

 -- 23. ������� ����������� �� QA ���������
SELECT MIN(monthly_salary) as MIN_SALARY_QA FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 24. ������� ������������ �� QA ���������
SELECT MAX(monthly_salary) as MAX_SALARY_QA FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 25. ������� ���������� QA ���������
SELECT COUNT(role_name) as QTY_QA FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%QA%';

 -- 26. ������� ���������� Middle ������������.
SELECT COUNT(role_name) as QTY_MIDDLE FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%Middle%';


 -- 27. ������� ���������� �������������
SELECT COUNT(role_name) as QTY_DEVS FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%developer%';

 -- 28. ������� ���� (�����) �������� �������������.
SELECT SUM(monthly_salary) as SUM_SALARY_DEVS FROM employee_salary ES
join salary S on S.id = ES.salary_id
RIGHT join roles_employee RE on RE.employee_id = ES.employee_id
join roles R on R.id = RE.role_id
where role_name like '%developer%';

 -- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
order by monthly_salary;

 -- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary;

 -- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where monthly_salary < 2300
order by monthly_salary;

 -- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
SELECT employee_name, role_name, monthly_salary FROM employees E
left join employee_salary ES on ES.employee_id = E.id
left join salary S on S.id = ES.salary_id
join roles_employee RE on RE.employee_id = E.id
join roles R on R.id = RE.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;
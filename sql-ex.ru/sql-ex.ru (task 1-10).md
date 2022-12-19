#### **[Схема базы данных](https://sql-ex.ru/help/select13.php#db_1)**

**Схема БД "Компьютерная фирма" состоит из четырех таблиц:**
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)

Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

Задание: 1 - Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
```sql
select model, speed, hd from PC where price < 500;
```
Задание: 2 - Найдите производителей принтеров. Вывести: maker
```sql
select distinct maker from Product where type = 'Printer';
```
Задание: 3 - Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
```sql
select model, ram, screen from Laptop where price > 1000;
```
Задание: 4 - Найдите все записи таблицы Printer для цветных принтеров.
```sql
select * from Printer where color = 'y';
```
Задание: 5 - Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
```sql
select model, speed, hd from PC where cd = '12x' and price < 600 or cd = '24x' and price < 600;
```
Задание: 6 - Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
```sql
select distinct Product.maker, Laptop.speed from Product inner join Laptop on Product.model = Laptop.model where Laptop.hd >= 10;
```
Задание: 7 - Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
```sql
select PC.model, PC.price from PC inner join Product on PC.model = Product.model where Product.maker = 'B'
union
select Laptop.model, Laptop.price from Laptop inner join Product on Laptop.model = Product.model where Product.maker = 'B'
union
select Printer.model, Printer.price from Printer inner join Product on Printer.model = Product.model where Product.maker = 'B'
```
Задание: 8 - Найдите производителя, выпускающего ПК, но не ПК-блокноты.
```sql
select maker from Product where type = 'PC' 
except
select maker from Product where type = 'Laptop'
```
Задание: 9 - Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
```sql
select distinct maker from Product 
join PC on Product.model = PC.model
where speed >= '450'
```
Задание: 10 - Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
```sql
select model, price from Printer where price = (select max(price) from Printer)
```
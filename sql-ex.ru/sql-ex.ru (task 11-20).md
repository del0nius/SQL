#### **[Схема БД Компьютерная фирма](https://sql-ex.ru/help/select13.php#db_1)**
#### **[Схема БД Корабли](https://www.sql-ex.ru/help/select13.php#db_3)**

**Схема БД "Компьютерная фирма" состоит из четырех таблиц:**
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
---

Задание: 11 - Найдите среднюю скорость ПК.
```sql
select AVG(speed) from PC;
```
Задание: 12 - Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
```sql
select AVG(speed) from Laptop where price > 1000;
```
Задание: 13 - Найдите среднюю скорость ПК, выпущенных производителем A.
```sql
select AVG(speed) from PC 
join Product on PC.model = Product.model
where maker = 'A';
```
Задание: 14 - Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
```sql
select Ships.class, name, country from Ships
join Classes on Ships.class = Classes.class
where numGuns >= 10;
```
Задание: 15 - Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
```sql
select hd from PC group by hd having count(*) > 1;
```
Задание: 16 - Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
```sql
select distinct P.model, L.model, P.speed, P.ram from PC P 
join 
PC L on L.speed = P.speed and L.ram = P.ram and L.model < P.model
```
Задание: 17 - Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
```sql
select distinct P.type, L.model, L.speed from Laptop L
join
Product P on L.model = P.model where L.speed < all(select speed from PC);
```
Задание: 18 - Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
```sql
select distinct Product.maker, Printer.price from Printer 
join Product on Printer.model = Product.model
where color = 'y' and price = (select min(price) from Printer where color = 'y')
```
Задание: 19 - Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
```sql
select Product.Maker, AVG(Laptop.screen) as Avg_screen from Laptop 
join Product on Laptop.model = Product.model
group by Product.maker
```
Задание: 20 - Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
```sql
select Product.Maker, count(Product.model) as Count_Model from Product
where Product.type = 'PC'
group by Product.Maker
having count(Product.model) >= 3
```
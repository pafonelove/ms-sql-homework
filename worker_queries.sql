use service_centerDB;

-- //////// ЗАПРОСЫ  ДЛЯ ТИПОВОГО ПОЛЬЗОВАТЕЛЯ "РАБОТНИК СЕРВИСНОГО ЦЕНТРА" //////// 
-- Запросы на выборку.
/*
SELECT * FROM Appeal
ORDER BY Дата_обращения;

SELECT Номер_заявки, Id_контактных_данных_клиента, Возможность_доставки
FROM Appeal
ORDER BY Id_контактных_данных_клиента;

SELECT * FROM Contact WHERE [E-mail] IS NOT NULL;
*/

-- Запросы на изменение данных.
/*
UPDATE Appeal
SET Id_ответственного_за_диагностику=3 WHERE Id_ответственного_за_диагностику=1;

UPDATE Contact
SET [E-mail]='no e-mail' WHERE [E-mail] IS NULL;

UPDATE Appeal
SET Возможность_Доставки='No' WHERE Стоимость_работ < 15000;
UPDATE Appeal
SET Возможность_Доставки='Yes' WHERE Стоимость_работ >= 15000;
*/

-- Запросы GROUP BY, HAVING.
/*
SELECT Возможность_доставки, MIN(Стоимость_работ) As Минимальная_прибыль, SUM(Стоимость_работ) As Общая_прибыль, AVG(Стоимость_работ) As Средняя_прибыль
FROM Appeal
GROUP BY Возможность_доставки;

SELECT Тип_устройства, COUNT(*) As Количество
FROM Device
GROUP BY Тип_устройства
HAVING COUNT(*) > 1
ORDER BY Количество DESC;
*/

-- Соединение таблиц
/*
SELECT D.Id, D.Тип_устройства, D.Год_выпуска, D.Изготовитель
FROM Device AS D
JOIN Issue AS I ON I.Id = D.Id
WHERE Гарантийный_ремонт = 'Yes'
ORDER BY Год_выпуска DESC;
*/

-- //////// ЗАПРОСЫ  ДЛЯ ТИПОВОГО ПОЛЬЗОВАТЕЛЯ "РУКОВОДИТЕЛЬ СЕРВИСНОГО ЦЕНТРА" ////////
-- Запросы на выборку.
/*
SELECT * FROM Delivery
ORDER BY Дата_поставки;

SELECT * FROM Part
ORDER BY Название_детали

SELECT * FROM Device
WHERE Тип_устройства = 'PC'
ORDER BY Серийный_номер;
*/

-- Запросы на изменение данных.
/*
UPDATE Issue
SET Гарантийный_ремонт='No' WHERE Уровень_поломки != 'Critical';
UPDATE Issue
SET Гарантийный_ремонт='Yes' WHERE Уровень_поломки = 'Critical';

UPDATE Delivery
SET Стоимость_поставки += 15000 WHERE Поставщик = 'Pavlov_Details';
UPDATE Delivery
SET Стоимость_поставки_без_НДС += 1500 WHERE Поставщик = 'Pavlov_Details';

UPDATE Shipper SET Id_менеджера = 5;
select Название_фирмы, [E-mail], Id_менеджера from shipper;
*/

-- Запросы GROUP BY, HAVING.
/*
SELECT Для_какой_техники_детали, MIN(Стоимость_поставки) As Минимальная_цена, MAX(Стоимость_поставки) As Максимальная_цена, AVG(Стоимость_поставки) As Средняя_цена
FROM Delivery
GROUP BY Для_какой_техники_детали
HAVING AVG(Стоимость_поставки) % 10 = 0
ORDER BY Средняя_цена DESC;

SELECT ФИО_приемщика, COUNT(Название_поставки) As Количество_принятых_поставок
FROM Delivery
GROUP BY ФИО_приемщика
HAVING COUNT(Название_поставки) > 1;
*/

-- Соединение таблиц
/*
select Id, Стоимость_поставки_без_НДС from Delivery;
select Id, Название_фирмы from Shipper;

SELECT S.Id, S.Название_фирмы, Адрес_поставщика, [E-mail]
FROM Shipper AS S
JOIN Delivery AS D ON D.Id = S.Id
WHERE D.Стоимость_поставки_без_НДС > 250000
ORDER BY D.Стоимость_поставки DESC;
*/
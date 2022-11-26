use service_centerDB;

/* //////// ЗАПРОСЫ  ДЛЯ ТИПОВОГО ПОЛЬЗОВАТЕЛЯ "РАБОТНИК СЕРВИСНОГО ЦЕНТРА" //////// */


/* Запросы на выборку */
/*
SELECT * FROM Appeal
ORDER BY Дата_обращения;

SELECT Номер_заявки, Id_контактных_данных_клиента, Возможность_доставки
FROM Appeal
ORDER BY Id_контактных_данных_клиента;

SELECT * FROM Contact WHERE [E-mail] IS NOT NULL;
*/

/* Запросы на изменение данных */
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

/* Запросы на удаление данных */


/* //////// ЗАПРОСЫ  ДЛЯ ТИПОВОГО ПОЛЬЗОВАТЕЛЯ "РУКОВОДИТЕЛЬ СЕРВИСНОГО ЦЕНТРА" //////// */
/* Запросы на выборку */
/*
SELECT * FROM Delivery
ORDER BY Дата_поставки;

SELECT * FROM Part
ORDER BY Название_детали

SELECT * FROM Device
WHERE Тип_устройства = 'PC'
ORDER BY Серийный_номер;
*/

/* Запросы на изменение данных */
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
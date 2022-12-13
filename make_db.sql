-- Создание базы данных.
CREATE DATABASE service_centerDB;
use service_centerDB;

-- Создание таблиц.
CREATE TABLE Appeal
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Дата_обращения] DATE NOT NULL,
	[Id_устройства]	INT NOT NULL,
	[Id_неисправности]	INT NOT NULL,
	[Id_ответственного_за_диагностику] INT NOT NULL,
	[Номер_заявки] NCHAR(20) NOT NULL,
	[Id_контактных_данных_клиента] INT NOT NULL,
	[Возможность_доставки] NCHAR(10),
	[Дата_выполнения] DATE NOT NULL,
	[Стоимость_работ] FLOAT NOT NULL
);

CREATE TABLE Contact
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[E-mail] NCHAR(20),
	[Номер_телефона] NCHAR(15) NOT NULL,
	[Адрес_доставки] NCHAR(40) NOT NULL
);

CREATE TABLE Delivery
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Название_поставки] NCHAR(20) NOT NULL,
	[Номер_поставки] INT NOT NULL,
	[Дата_поставки] DATE NOT NULL,
	[Поставщик] NCHAR(20) NOT NULL,
	[Для_какой_техники_детали] NCHAR(30) NOT NULL,
	[Стоимость_поставки] INT NOT NULL,
	[Стоимость_поставки_без_НДС] INT NOT NULL,
	[ФИО_приемщика] NCHAR(30) NOT NULL
);


CREATE TABLE Device
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Название_устройства] NCHAR(20),
	[Тип_устройства] NCHAR(10) NOT NULL,
	[Иготовитель] NCHAR(20),
	[Модель] NCHAR(10) NOT NULL,
	[Серийный_номер] NCHAR(10),
	[Год_выпуска] DATE
);

CREATE TABLE Employee
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[ФИО_работника] NCHAR(30) NOT NULL,
	[Должность] NCHAR(20) NOT NULL,
	[Уровень_кометенций] NCHAR(20) NULL
);

CREATE TABLE Employee
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Уровень_поломки] NCHAR(10) NOT NULL,
	[Гарантийный_ремонт] NCHAR(5) NOT NULL
);

CREATE TABLE Part
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Название_детали] NCHAR(20) NOT NULL,
	[Код_детали] NCHAR(10) NOT NULL,
	[Для_какой_техники_деталь] NCHAR(30) NOT NULL,
	[Количество_на_складе] INT NOT NULL
);

CREATE TABLE Shipper
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Название_фирмы] NCHAR(20) NOT NULL,
	[Адрес_поставщика] NCHAR(30) NOT NULL,
	[Телефон_поставщика] NCHAR(15) NOT NULL,
	[E-mail] NCHAR(20) NOT NULL
);

-- Добавление столбцов для установления зависимостей между таблицами.

ALTER TABLE dbo.Device
	ADD Id_детали_под_замену INT NOT NULL;

ALTER TABLE dbo.Issue
	ADD Id_устройства INT NOT NULL;

ALTER TABLE dbo.Delivery
	ADD Id_поставщика INT NOT NULL;

ALTER TABLE dbo.Part
	ADD Id_поставки INT NOT NULL;

ALTER TABLE dbo.Shipper
	ADD Id_менеджера INT NOT NULL;

-- Добавление внешних ключей для установления зависимостей между таблицами.

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Device FOREIGN KEY (Id_устройства) REFERENCES dbo.Device(Id);

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Issue FOREIGN KEY (Id_неисправности) REFERENCES dbo.Issue(Id);

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Employee FOREIGN KEY (Id_ответственного_за_диагностику) REFERENCES dbo.Employee(Id);

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Contact FOREIGN KEY (Id_контактных_данных_клиента) REFERENCES dbo.Contact(Id);

ALTER TABLE dbo.Device
	ADD CONSTRAINT FK_Device_Part FOREIGN KEY (Id_детали_под_замену) REFERENCES dbo.Part(Id);

ALTER TABLE dbo.Issue
	ADD CONSTRAINT FK_Issue_Device FOREIGN KEY (Id_устройства) REFERENCES dbo.Device(Id);

ALTER TABLE dbo.Part
	ADD CONSTRAINT FK_Part_Delivery FOREIGN KEY (Id_поставки) REFERENCES dbo.Delivery(Id);

ALTER TABLE dbo.Delivery
	ADD CONSTRAINT FK_Delivery_Shipper FOREIGN KEY (Id_поставщика) REFERENCES dbo.Shipper(Id);

ALTER TABLE dbo.Shipper
	ADD CONSTRAINT FK_Shipper_Employee FOREIGN KEY (Id_менеджера) REFERENCES dbo.Employee(Id);
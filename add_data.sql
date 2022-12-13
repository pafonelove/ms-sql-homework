use service_centerDB;

-- Добавление начальных данных в таблицу Employee.
INSERT INTO Employee
VALUES
(0, 'Ivanov_PA', 'Trainee', 'Without_experience'),
(1, 'Sergeev_SV', 'Specialist', '2_years'),
(2, 'Zavyalov_DO', 'Specialist', '1_year'),
(3, 'Zabrodin_DV', 'Engineer', '4_years'),
(4, 'Maslova_EP', 'Manager', '3_years'),
(5, 'Astafjev_IP', 'Engineer', '4_years'),
(6, 'Okunev_DK', 'Trainee', '6_months');

-- Добавление начальных данных в таблицу Shipper.
DBCC CHECKIDENT (Shipper, RESEED, 0);
INSERT INTO Shipper
VALUES 
('Pavlov_Details', 'Moscow, pr. Lenina, 9', '+79991110211', 'pavlov123@mail.ru', 4),
('PC_Repair', 'Moscow, Arkadjeva, 121', '+79951249101', 'pr@repair.ru', 4),
('PC_for_PC', 'Ufa, Tvardovskogo, 121b', '+79283544444', 'pcstore@rambler.ru', 4),
('Construct_PC', 'Belgorod, Yuzhnaya, 10a', '+79911110101', 'compone@gmail.com', 4),
('Portal_In_PC_World', 'Ulyanovsk, Centraljnaya, 287/2', '+79128084976', 'pipw@shop.ru', 4),
('PartsDirect', 'Saratov, Moskovskaya, 92, ', '+78452338442', 'parts@direct.ru', 4),
('Service-Mag', 'Saratov, Chernyshevskogo, 153', '+79379700365', 's-mag@yandex.ru', 4);

-- Добавление начальных данных в таблицу Delivery.
DBCC CHECKIDENT (Delivery, RESEED, 0);
INSERT INTO Delivery
VALUES
('Matrix_for_monitors', '121012', '2015-10-21', 'PC_Repair', 'Monitor', 120000, 100000, 'Sergeev_SV', 2),
('Details_for_printers', '021021', '2013-02-26', 'Pavlov_Details', 'Printer', 240000, 200000, 'Sergeev_SV', 1),
('Processors_for_PC', '001213', '2017-08-15', 'PC_for_PC', 'PC_processor', 100000, 80000, 'Astafjev_IP', 3),
('Parts_for_scanners', '287902', '2016-10-01', 'PartsDirect', 'Scan_glass', 470000, 460000, 'Zavyalov_DO', 6),
('HDD_for_PC', '018098', '2018-11-11', 'Construct_PC', 'PC', 725000, 719000, 'Zabrodin_DV', 4),
('Motherboards_for_PC', '222123', '2019-02-01', 'Portal_In_PC_World', 'PC', 528000, 518000, 'Zayalov_DO', 5),
('Power_supplies', '597102', '2020-09-01', 'Service-Mag', 'Monitor', 245000, 240000, 'Astafjev_IP', 7);


-- Добавление начальных данных в таблицу Part.
DBCC CHECKIDENT (Part, RESEED, 0);
INSERT INTO Part
VALUES 
('Matrix_101A', '001001', 'Monitor', 110, 1),
('Display_202XML', '002001', 'Printer', 52, 2),
('Intel_i5', '020101', 'PC', 45, 3),
('Scanner_glass', '009098', 'Scanner', 31, 4),
('Hard_disk', '010980', 'PC', 19, 5),
('Asus_B450M', '098001', 'PC', 10, 6),
('PS_213A', '987980', 'Monitor', 98, 7);

-- Добавление начальных данных в таблицу Device.
DBCC CHECKIDENT (Device, RESEED, 0);
INSERT INTO Device
VALUES
('Acer_209VX', 'Monitor', 'Acer', '209VX', 'S1XC245B80', '2013-05-01', 1),
('HP_9870', 'Printer', 'HP', '9870', 'A123JVM910', '2015-04-08', 2),
('DEXP_DX1CA', 'PC', 'DEXP', 'DX1CA', 'DXP1098484', '2020-10-04', 3),
('Canon_SCR10', 'Scanner', 'Canon', 'SCR10', 'CN0N091243', '2017-12-20', 4),
('BOX_9801', 'PC', 'Ator', '9801', '0901ATR300', '2016-04-27', 5),
('AMD_Hyper2', 'PC', 'AMD', 'Hyper2', 'DMA9001001', '2021-02-04', 6),
('Dell_Q2A', 'Monitor', 'Dell', 'Q2A', 'Q001X2F890', '2019-08-15', 7);

-- Добавление начальных данных в таблицу Issue.
DBCC CHECKIDENT (Issue, RESEED, 0);
INSERT INTO Issue
VALUES
('Critical', 'Yes', 1),
('Medium', 'No', 2),
('High', 'No', 3),
('Critical', 'Yes', 4),
('Low', 'Yes', 5),
('Critical', 'No', 6),
('Medium', 'Yes', 7);

-- Добавление начальных данных в таблицу Contact.
DBCC CHECKIDENT (Contact, RESEED, 0);
INSERT INTO Contact
VALUES
('npetrov@yandex.ru', '+79098431201', 'Moscow, Burova, 8'),
('asbagrova@mail.ru', '+79280193242', 'Moscow, Kaplan, 124a'),
('your123@gmail.com', '+7901566655', 'Ufa, Sagdyrova, 98/3b'),
('vandal09@rambler.ru', '+7910976543', 'Belgorod, Severnaja, 1'),
('masha143@gmail.com', '+7909544123', 'Ulyanovsk, V. Lyukshina, 101/1');
INSERT INTO Contact([Номер_телефона], [Адрес_доставки])
VALUES
('+79178730192', 'Saratov, Kutyakova, 45'),
('+79276667812', 'Saratov, pr. Stolypina, 25');

-- Добавление начальных данных в таблицу Appeal.
DBCC CHECKIDENT (Appeal, RESEED, 0);
INSERT INTO Appeal
VALUES
('2021-10-05', 1, 1, 0, '10101a', 1, 'Yes', '2021-10-15', 15000),
('2021-11-21', 2, 2, 1, '10175b', 2, 'Yes', '2021-12-13', 8000),
('2021-12-25', 3, 3, 1, '10189a', 3, 'No', '2022-01-14', 12500),
('2022-02-25', 4, 4, 3, '10202b', 4, 'No', '2022-03-07', 20000),
('2022-04-10', 5, 5, 6, '10112a', 5, 'Yes', '2022-05-17', 11500),
('2022-06-11', 6, 6, 2, '101879', 6, 'Yes', '2022-07-01', 9000),
('2022-09-16', 7, 7, 0, '12345a', 7, 'No', '2022-09-30', 12500);
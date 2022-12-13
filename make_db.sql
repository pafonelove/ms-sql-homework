-- �������� ���� ������.
CREATE DATABASE service_centerDB;
use service_centerDB;

-- �������� ������.
CREATE TABLE Appeal
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[����_���������] DATE NOT NULL,
	[Id_����������]	INT NOT NULL,
	[Id_�������������]	INT NOT NULL,
	[Id_��������������_��_�����������] INT NOT NULL,
	[�����_������] NCHAR(20) NOT NULL,
	[Id_����������_������_�������] INT NOT NULL,
	[�����������_��������] NCHAR(10),
	[����_����������] DATE NOT NULL,
	[���������_�����] FLOAT NOT NULL
);

CREATE TABLE Contact
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[E-mail] NCHAR(20),
	[�����_��������] NCHAR(15) NOT NULL,
	[�����_��������] NCHAR(40) NOT NULL
);

CREATE TABLE Delivery
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[��������_��������] NCHAR(20) NOT NULL,
	[�����_��������] INT NOT NULL,
	[����_��������] DATE NOT NULL,
	[���������] NCHAR(20) NOT NULL,
	[���_�����_�������_������] NCHAR(30) NOT NULL,
	[���������_��������] INT NOT NULL,
	[���������_��������_���_���] INT NOT NULL,
	[���_���������] NCHAR(30) NOT NULL
);


CREATE TABLE Device
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[��������_����������] NCHAR(20),
	[���_����������] NCHAR(10) NOT NULL,
	[�����������] NCHAR(20),
	[������] NCHAR(10) NOT NULL,
	[��������_�����] NCHAR(10),
	[���_�������] DATE
);

CREATE TABLE Employee
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[���_���������] NCHAR(30) NOT NULL,
	[���������] NCHAR(20) NOT NULL,
	[�������_����������] NCHAR(20) NULL
);

CREATE TABLE Employee
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[�������_�������] NCHAR(10) NOT NULL,
	[�����������_������] NCHAR(5) NOT NULL
);

CREATE TABLE Part
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[��������_������] NCHAR(20) NOT NULL,
	[���_������] NCHAR(10) NOT NULL,
	[���_�����_�������_������] NCHAR(30) NOT NULL,
	[����������_��_������] INT NOT NULL
);

CREATE TABLE Shipper
(
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[��������_�����] NCHAR(20) NOT NULL,
	[�����_����������] NCHAR(30) NOT NULL,
	[�������_����������] NCHAR(15) NOT NULL,
	[E-mail] NCHAR(20) NOT NULL
);

-- ���������� �������� ��� ������������ ������������ ����� ���������.

ALTER TABLE dbo.Device
	ADD Id_������_���_������ INT NOT NULL;

ALTER TABLE dbo.Issue
	ADD Id_���������� INT NOT NULL;

ALTER TABLE dbo.Delivery
	ADD Id_���������� INT NOT NULL;

ALTER TABLE dbo.Part
	ADD Id_�������� INT NOT NULL;

ALTER TABLE dbo.Shipper
	ADD Id_��������� INT NOT NULL;

-- ���������� ������� ������ ��� ������������ ������������ ����� ���������.

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Device FOREIGN KEY (Id_����������) REFERENCES dbo.Device(Id);

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Issue FOREIGN KEY (Id_�������������) REFERENCES dbo.Issue(Id);

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Employee FOREIGN KEY (Id_��������������_��_�����������) REFERENCES dbo.Employee(Id);

ALTER TABLE dbo.Appeal
	ADD CONSTRAINT FK_Appeal_Contact FOREIGN KEY (Id_����������_������_�������) REFERENCES dbo.Contact(Id);

ALTER TABLE dbo.Device
	ADD CONSTRAINT FK_Device_Part FOREIGN KEY (Id_������_���_������) REFERENCES dbo.Part(Id);

ALTER TABLE dbo.Issue
	ADD CONSTRAINT FK_Issue_Device FOREIGN KEY (Id_����������) REFERENCES dbo.Device(Id);

ALTER TABLE dbo.Part
	ADD CONSTRAINT FK_Part_Delivery FOREIGN KEY (Id_��������) REFERENCES dbo.Delivery(Id);

ALTER TABLE dbo.Delivery
	ADD CONSTRAINT FK_Delivery_Shipper FOREIGN KEY (Id_����������) REFERENCES dbo.Shipper(Id);

ALTER TABLE dbo.Shipper
	ADD CONSTRAINT FK_Shipper_Employee FOREIGN KEY (Id_���������) REFERENCES dbo.Employee(Id);
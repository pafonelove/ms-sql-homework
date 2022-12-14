use service_centerDB;

-- //////// �������  ��� �������� ������������ "�������� ���������� ������" //////// 
-- ������� �� �������.
/*
SELECT * FROM Appeal
ORDER BY ����_���������;

SELECT �����_������, Id_����������_������_�������, �����������_��������
FROM Appeal
ORDER BY Id_����������_������_�������;

SELECT * FROM Contact WHERE [E-mail] IS NOT NULL;
*/

-- ������� �� ��������� ������.
/*
UPDATE Appeal
SET Id_��������������_��_�����������=3 WHERE Id_��������������_��_�����������=1;

UPDATE Contact
SET [E-mail]='no e-mail' WHERE [E-mail] IS NULL;

UPDATE Appeal
SET �����������_��������='No' WHERE ���������_����� < 15000;
UPDATE Appeal
SET �����������_��������='Yes' WHERE ���������_����� >= 15000;
*/

-- ������� GROUP BY, HAVING.
/*
SELECT �����������_��������, MIN(���������_�����) As �����������_�������, SUM(���������_�����) As �����_�������, AVG(���������_�����) As �������_�������
FROM Appeal
GROUP BY �����������_��������;

SELECT ���_����������, COUNT(*) As ����������
FROM Device
GROUP BY ���_����������
HAVING COUNT(*) > 1
ORDER BY ���������� DESC;
*/

-- ���������� ������
/*
SELECT D.Id, D.���_����������, D.���_�������, D.������������
FROM Device AS D
JOIN Issue AS I ON I.Id = D.Id
WHERE �����������_������ = 'Yes'
ORDER BY ���_������� DESC;
*/

-- //////// �������  ��� �������� ������������ "������������ ���������� ������" ////////
-- ������� �� �������.
/*
SELECT * FROM Delivery
ORDER BY ����_��������;

SELECT * FROM Part
ORDER BY ��������_������

SELECT * FROM Device
WHERE ���_���������� = 'PC'
ORDER BY ��������_�����;
*/

-- ������� �� ��������� ������.
/*
UPDATE Issue
SET �����������_������='No' WHERE �������_������� != 'Critical';
UPDATE Issue
SET �����������_������='Yes' WHERE �������_������� = 'Critical';

UPDATE Delivery
SET ���������_�������� += 15000 WHERE ��������� = 'Pavlov_Details';
UPDATE Delivery
SET ���������_��������_���_��� += 1500 WHERE ��������� = 'Pavlov_Details';

UPDATE Shipper SET Id_��������� = 5;
select ��������_�����, [E-mail], Id_��������� from shipper;
*/

-- ������� GROUP BY, HAVING.
/*
SELECT ���_�����_�������_������, MIN(���������_��������) As �����������_����, MAX(���������_��������) As ������������_����, AVG(���������_��������) As �������_����
FROM Delivery
GROUP BY ���_�����_�������_������
HAVING AVG(���������_��������) % 10 = 0
ORDER BY �������_���� DESC;

SELECT ���_���������, COUNT(��������_��������) As ����������_��������_��������
FROM Delivery
GROUP BY ���_���������
HAVING COUNT(��������_��������) > 1;
*/

-- ���������� ������
/*
select Id, ���������_��������_���_��� from Delivery;
select Id, ��������_����� from Shipper;

SELECT S.Id, S.��������_�����, �����_����������, [E-mail]
FROM Shipper AS S
JOIN Delivery AS D ON D.Id = S.Id
WHERE D.���������_��������_���_��� > 250000
ORDER BY D.���������_�������� DESC;
*/
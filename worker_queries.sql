use service_centerDB;

/* //////// �������  ��� �������� ������������ "�������� ���������� ������" //////// */


/* ������� �� ������� */
/*
SELECT * FROM Appeal
ORDER BY ����_���������;

SELECT �����_������, Id_����������_������_�������, �����������_��������
FROM Appeal
ORDER BY Id_����������_������_�������;

SELECT * FROM Contact WHERE [E-mail] IS NOT NULL;
*/

/* ������� �� ��������� ������ */
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

/* ������� �� �������� ������ */


/* //////// �������  ��� �������� ������������ "������������ ���������� ������" //////// */
/* ������� �� ������� */
/*
SELECT * FROM Delivery
ORDER BY ����_��������;

SELECT * FROM Part
ORDER BY ��������_������

SELECT * FROM Device
WHERE ���_���������� = 'PC'
ORDER BY ��������_�����;
*/

/* ������� �� ��������� ������ */
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
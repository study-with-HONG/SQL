-- 10-1 ��Į�� �������� : ���������� SELECT ������ ���. �ݵ�� �ϳ��� �÷��� �ο� ��ȯ
SELECT e.emp_id, e.emp_name, e.gender, e.age, e.dept_id,
       (SELECT d.dept_name FROM master_department d
        WHERE e.dept_id=d.dept_id) dept_name
FROM master_employee e;

-- 10-2 �ܺ��������� ����
SELECT e.emp_id, e.emp_name, e.gender, e.age, e.dept_id, d.dept_name
FROM master_employee e, master_department d
WHERE e.dept_id=d.dept_id(+);

-- 10-3 �ζ��� �� : ���������� FROM ������ ���. ���� ���� �÷��� �ο� ��ȯ
SELECT d.dept_id, d.dept_name, i.emp_id, i.emp_name, i.address
FROM master_department d,
    (SELECT e.emp_id, e.emp_name, e.dept_id, a.si||' '||a.gu||' '||a.etc address
     FROM master_employee e, master_address a
     WHERE e.adrs_id=a.adrs_id) i
WHERE d.dept_id=i.dept_id
ORDER BY 1, 3;

-- 10-4 ��ø �������� : WHERE ������ ���. ���� ���� �÷��� �ο� ��ȯ
SELECT * FROM master_department d
WHERE d.dept_id=(SELECT e.dept_id FROM master_employee e
                 WHERE e.emp_name LIKE 'ȫ�浿%');
                 
-- 10-5 ��ø �������� ���� �� ��ȯ
SELECT * FROM master_department d
WHERE d.dept_id IN (SELECT e.dept_id FROM master_employee e
                    WHERE e.age BETWEEN 30 AND 50);

-- 10-6 ��ø �������� ���� �÷�, ���� �� ��ȯ
SELECT * FROM master_employee e
WHERE (e.gender, e.age)
    IN (SELECT ee.gender, ee.age
        FROM master_employee ee, master_address a
        WHERE ee.adrs_id=a.adrs_id AND a.gu IN ('�߱�', '���빮��'));
        
-- 10-7 ���� ���� : ��ø �������� ��� �̿�
--      EXISTS : ���������� �������� ������������ ��ȯ�ϴ� �����Ͱ� �����ϸ� TRUE ��ȯ
SELECT * FROM master_department d
WHERE EXISTS (SELECT '�ƹ��ų� �ۼ�' FROM master_employee e
              WHERE e.age BETWEEN 30 AND 50 AND d.dept_id=e.dept_id);

-- 10-8 ��Ƽ ���� : ���� ���ΰ� ���� ����. NOT ���
SELECT * FROM master_department d
WHERE d.dept_id NOT IN (SELECT e.dept_id FROM master_employee e
                        WHERE e.age BETWEEN 30 AND 50
                            AND e.dept_id IS NOT NULL);
                -- �������� ����� NULL�� ������ ���� ��ü�� FALSE�� �ż�
                -- �ƹ� ����� ������ �ʾ� IS NOT NULL ������ �־���� ��

-- 10-9 NOT EXISTS�� ����� ��Ƽ ����
SELECT * FROM master_department d
WHERE NOT EXISTS (SELECT '�ƹ��ų� �ۼ�' FROM master_employee e
                  WHERE e.age BETWEEN 30 AND 50 AND d.dept_id=e.dept_id);




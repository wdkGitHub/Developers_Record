---��ѯ���ݿ������е��û� ��Ҫdba Ȩ��
 grant dba to wdk_oracle;--���û��������dbaȨ��
 select username from dba_users;
 
 --��ѯϵͳ��ǰʱ��
 select sysdate from dual;

---��Ѫ���Ľṹ  describe ����; ��д :desc ֻ���������ִ��
 describe emp;

select * from emp where empno in (7839,7369);
select * from emp;

--concat(str1,str2) �������ַ���ƴ��
select empno ,concat('�����������?',job) from emp;  

--length(str); �ַ������� ���ֵ�λ��
select length(job),length(empno) from emp;

--upper(str); ȫ����д  
--lower(str) ȫ��Сд
--initcap(str) ����ĸ��д
select upper(job),upper(empno),lower(job),initcap(job) from emp;

--�ַ���ȡ
-- trim( str1 from str2) strֻ��ռ һ���ַ� ����ͷ��ȡ ֪����һ��Ϊֹ
-- ltrim( str1 , str2)
-- rtrim( str1 , str2)

select job ,trim('1'from'1211'), 
            ltrim('haoren','hao'),
            rtrim('haoren','ren')
     from emp where job='MANAGER';
--���
-- 2
--ren
--hao 


--lpad(str,n,pad):���ַ���str�� ��� ʹ��pad �������,�ܳ���Ϊ n    
--rpad(str,n,pad):���ַ���str�� �ұ� ʹ��pad �������,�ܳ���Ϊ n   
 select job,lpad('1200.00',10,'#') from emp ; --###1200.00  
 select rpad('1200.00',10,'#') ,job from emp; --1200.00### 
 select rpad(empno,7,'-id') ceshi ,empno ,job from emp;-- 1234-id
 select rpad(empno,6,'-id') ceshi ,empno ,job from emp; -- 1234-i
 
 
---substr(str,begin,length) �� str�� beginλ�� ��ȡ length ���� 
  select substr('01234567',3,4) from dual;--2345,begin��1��ʼ
  select substr('01234567',0,4) from dual;--0123
  select substr('01234567',-3,3) from dual;--567 ,������ʾ�Ӻ���ǰ
  select substr('01234567',-1,3) from dual;--7 ,-1��ʾ����λ��
  select substr('01234567',-4,3) from dual;--456
  select substr('01234567',-2,1) from dual;--6
  select substr('01234567',1,1) from dual; --0
  select substr('01234567',1,2) from dual; --01
  select substr('01234567',1,3) from dual; --012
  select substr('01234567',2,1) from dual; --1
  select substr('01234567',2,2) from dual; --12
  select substr('01234567',2,3) from dual; --123
  -- length С�ڵ���0 �����Ϊ null
  select substr('01234567',1,0) as s from dual where substr('01234567',1,-1) ='';
  select substr('01234567',1,-1) as s from dual where substr('01234567',1,-1) is null; 


--systimestamp ��ǰʱ��� sysdate ��ǰʱ��
select systimestamp  ,sysdate from dual; 

---round(n[,m]):��n ������������Ĳ���,m ��ʾ���� 
--ceil(n):����ȡ��    С��������0.00....1 �ͽ�һλ
--floor(n):����ȡ��  С���������
--mod(m,n):ȡ��
--power(n,m):���� n �� m ����
--sign(n):���n С��0 ����-1 ,����0 ����0 ,����0 ����1 
select round(456.78911741,6),
    round(1.834), round(1.234,1),round(1.234,2),round(1.236,2),
       ceil(0.99),
       ceil(0.000),
       ceil(0.000000000000001),
       floor(8.545),
       floor(8.054),
       mod(3,2) ,
       power(2,3) as"2^3",
       sign(-1),
        sign(0),
         sign(1) from dual;
       
       
 -- ���� ������� �� "" 
--coalesce(exp1,exp2,...):���ص�һ���ǿ�ֵ   expN����Ҫͬ
select coalesce(null,null,'abc') from dual;--abc
select coalesce(null,job,null) from emp;
select * from emp;
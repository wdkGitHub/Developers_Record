#PL\SQL#
##PLSQL Developer ##


>1. 在命令行窗口输入:
>2. set serveroutput on(不运行这段代码 执行PLSQL程序没有运行结果)
>3. ed (弹出编辑框 方便编写代码) 
>4.  输入 / 执行编辑框中的代码

输入ed 弹出编辑框 方便编辑


## Hello Word ##

    declare
    --声明的变量/类型/游标
    begin
      --程序的执行部分
      dbms_output.put_line('hello word');
     --exception
       --针对begin中出现的异常,提供处理机制
       --when ...then...
       --when ...then...
     end;

		declare 和exception 如果没用用到可以注释掉或不写

----------
例子
SQL语句:

>select e.salary from employees e where e.employee_id=123;

PL*SQL语句:

>declare
v_sal varchar2(20);
begin
select salary into v_sal from employees where employee_id=123;
  
>dbms_output.put_line(v_sal);
end;


	


PLSQL命名规则

|标识符|命名规则|例子|
|:------:|:-----:|:-----:|
|程序变量| **V_**name | V_name|
|程序常亮|**C_**name|C_company_name|
|游标变量|Name**_cursor**|Emp_cursor|
|异常变量|**E_**name|E_too_many|
|表类型|Name_table_type|Emp**_record_type**|
|表|Name_table|Emp|
|记录类型|Name**_record**|Emp_record|
|SQL*PLUS代替变量|P_name|P_sal|
|绑定变量|G_name|G_year_sal|


### 记录类型 ###

记录类型 类似于类 用于封装

    declare
	--声明一个记录类型
    	type sal_record is record(
    	 	v_sal varchar2(20),
			-- 使用employees表employee_id字段的类型
     	 	v_id employees.employee_id%type
     	 );
     -- 相当于Java中的实例化
     	 v_sal_record sal_record;
    begin
      
      select salary, employee_id into v_sal_record 
     
     		from employees where employee_id=123;
      
      dbms_output.put_line(v_sal_record.v_sal||','||v_sal_record.v_id);
    
    end;



----------

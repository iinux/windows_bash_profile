delimiter $$ # 定义结束符为 $$
drop procedure  if exists wk;  #  删除 已有的 存储过程
create procedure wk() #　 创建新的存储过程
begin
    while true do #   循环体
        select (@row_count:=count(*)) from stability;
        insert into `count`(`id`,`count`) values (now(), @row_count);
        select sleep(1);
    end while;
end $$ #  结束定义语句

# 调用

delimiter ; #  先把结束符 回复为;
call wk();

BEGIN
	#Routine body goes here...
	set @num='1';
	set @sql=CONCAT('select student_', @num, ' from ec_bus_lines');
	PREPARE stmt from @sql;
	EXECUTE stmt;
END

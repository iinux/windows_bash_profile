BEGIN
	#Routine body goes here...
	declare i int;
	set i = 1;
	while i <= 20 do
        insert coupon.ec_coupon_logs(user_id,source,coupon_id,start_at,end_at) values(4,'system',2,'2017-07-04','2017-08-04');
	set i = i +1;
	end while;
END

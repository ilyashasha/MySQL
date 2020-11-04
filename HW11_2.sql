CREATE DEFINER=`root`@`localhost` PROCEDURE `million_users`()
BEGIN
	DECLARE a INT DEFAULT 1;
    DECLARE i INT DEFAULT 0;
	WHILE i < 100 DO -- Чтобы не забивать память, сделал 100, но в общем то тут может быть и 1000000
		INSERT INTO users_for_test_million(id,`firstname`, `lastname`, birthday_at) VALUES (a, CONCAT('firstname_', a), CONCAT('lastname_', a), NOW());
		SET a = a + 1;
        SET i = i + 1;
	END WHILE;
END
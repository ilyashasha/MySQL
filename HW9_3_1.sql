CREATE DEFINER=`root`@`localhost` FUNCTION `hello`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	SET @`time` = HOUR(CURTIME());
	SET @gmorning = 'Доброе утро';
    SET @gday = 'Добрый день';
    SET @gevenin = 'Добрый вечер';
    SET @gnight = 'Доброй ночи';
    SET @er = 'Ошибка';
    
    IF(@`time` BETWEEN '6' AND '12') THEN
		return @gmorning;
	ELSEIF(@`time` BETWEEN '12' AND '18') THEN
		return @gday;
	ELSEIF(@`time` BETWEEN '18' AND '24') THEN
		return @gevenin;
	ELSEIF(@`time` BETWEEN '0' AND '6') THEN
		return @gnight;
	ELSE
		return @er;
	END IF;
RETURN 1;
END
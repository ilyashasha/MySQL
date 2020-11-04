CREATE DEFINER=`root`@`localhost` TRIGGER `users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO logs (created_at, `table_name`, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.lastname);
END
CREATE DEFINER=`root`@`localhost` TRIGGER `products_AFTER_INSERT` AFTER INSERT ON `products` FOR EACH ROW BEGIN
	INSERT INTO logs (created_at, `table_name`, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END
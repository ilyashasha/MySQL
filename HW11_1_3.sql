CREATE DEFINER=`root`@`localhost` TRIGGER `catalogs_AFTER_INSERT` AFTER INSERT ON `catalogs` FOR EACH ROW BEGIN
	INSERT INTO logs (created_at, `table_name`, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END
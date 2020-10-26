CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `product_catalog_view` AS
    SELECT 
        `prod`.`name` AS `Product_name`,
        `cat`.`name` AS `Catalog_name`
    FROM
        (`catalogs` `cat`
        JOIN `products` `prod`)
    WHERE
        (`cat`.`id` = `prod`.`catalog_id`)
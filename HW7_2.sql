-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	id,
    `name`,
    (SELECT `name` FROM catalogs WHERE id = catalog_id) AS `Catalog name`
    FROM shop.products;

SELECT 
	p.`name` AS `Product_name`,
    c.`name` AS `Catalog_name`
FROM 
	shop.catalogs AS c
JOIN
	shop.products AS p
WHERE
	c.id = p.catalog_id;


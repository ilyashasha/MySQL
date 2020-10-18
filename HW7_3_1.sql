-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
SELECT 
    id,
    CASE `from`
		WHEN (SELECT lable FROM cities WHERE lable = flights.`from`) THEN (SELECT Russian_name FROM cities WHERE lable = flights.`from`)
	END AS `from`,
    CASE `to`
		WHEN (SELECT lable FROM cities WHERE lable = flights.`to`) THEN (SELECT Russian_name FROM cities WHERE lable = flights.`to`)
	END AS `to`
FROM shop.flights;
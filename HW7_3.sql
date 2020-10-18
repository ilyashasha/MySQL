-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
SELECT 
    id,
    CASE `from`
		WHEN 'Moskow' THEN 'Москва'
        WHEN 'Amsterdam' THEN 'Амстердам'
        WHEN 'Berlin' THEN 'Берлин'
        WHEN 'Chicago' THEN 'Чикаго'
        WHEN 'Kiev' THEN 'Киев'
        WHEN 'Beijing' THEN 'Пекин'
        WHEN 'Barcelona' THEN 'Барселона'
        WHEN 'Budapest' THEN 'Будапешт'
        WHEN 'Dublin' THEN 'Дублин'
        WHEN 'Lisbon' THEN 'Лиссабон'
	END AS `from`,
    CASE `to`
		WHEN 'Moskow' THEN 'Москва'
        WHEN 'Amsterdam' THEN 'Амстердам'
        WHEN 'Berlin' THEN 'Берлин'
        WHEN 'Chicago' THEN 'Чикаго'
        WHEN 'Kiev' THEN 'Киев'
        WHEN 'Beijing' THEN 'Пекин'
        WHEN 'Barcelona' THEN 'Барселона'
        WHEN 'Budapest' THEN 'Будапешт'
        WHEN 'Dublin' THEN 'Дублин'
        WHEN 'Lisbon' THEN 'Лиссабон'
	END AS `to`
FROM shop.flights;

-- вариант 1, второй более логичный вариант смотри под номером HW7_3_1
SELECT
	id,
    `name`,
    birthday_at,
    DAYOFWEEK(birthday_at) as Day_week
FROM shop.users
ORDER BY day_week;

SELECT
    DAYOFWEEK(birthday_at) AS Day_week,
    COUNT(id) AS `Amount`
FROM shop.users
group by DAYOFWEEK(birthday_at)
Order By Day_week;
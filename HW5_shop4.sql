SELECT
	id,
    `name`,
    birthday_at
FROM shop.users
WHERE monthname(birthday_at) = 'may' OR monthname(birthday_at) = 'august'
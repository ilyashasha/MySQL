SELECT 
	id,
    `name`,
    birthday_at,
    timestampdiff(year, birthday_at, NOW()) AS age
FROM shop.users
ORDER BY age;

SELECT avg(timestampdiff(year, birthday_at, NOW())) AS averafe_age FROM shop.users;
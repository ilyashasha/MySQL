SELECT
	gender,
    GROUP_CONCAT(users_id) AS `list`,
    (SELECT COUNT(*) FROM likes WHERE from_users_id in (SELECT users_id FROM vk.profiles WHERE gender = 'm')) AS `Amount M`,
    (SELECT COUNT(*) FROM likes WHERE from_users_id in (SELECT users_id FROM vk.profiles WHERE gender = 'f')) AS `Amount F`
    -- Знаю, что не совсем красиво, но не могу разобраться как сделать для каждой строки отдельно
FROM vk.profiles
WHERE gender IN ('m', 'f')
GROUP BY gender;

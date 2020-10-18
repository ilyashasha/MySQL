SELECT
	gender,
    GROUP_CONCAT(users_id) AS `list`,
    (SELECT COUNT(*) FROM vk.likes WHERE from_users_id in (1,41,3,4,47,6,27,39,9,64,30,44,16,32,19,21,33,24,51,54,65,66,67,72,75,76,77,79,90,92,93,94,97)) AS `Amount M`,
    (SELECT COUNT(*) FROM vk.likes WHERE from_users_id in (38,40,43,11,50,2,52,5,56,57,61,63,35,7,8,12,68,69,14,74,18,22,25,26,80,81,82,85,86,87,88,89,29,91,31,34,36,95,37,100)) AS `Amount F`
    -- Знаю, что неправильно, но не могу разобраться как засунуть значения получающиееся в столбце GROUP_CONCAT в условие внутри подзапроса.
FROM vk.profiles
WHERE gender IN ('m', 'f')
GROUP BY gender;

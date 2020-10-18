-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
SELECT 
	id,
    firstname,
    lastname,
    (SELECT count(*) FROM friend_requests WHERE from_user_id = users.id) AS `Amount of send requests`,
    (SELECT count(*) FROM media WHERE user_id = users.id) AS `Amount of users media`,
    (SELECT count(*) FROM messages WHERE from_user_id = users.id) AS `Amount of send messages`,
    (SELECT count(*) FROM users_communities WHERE user_id = users.id) AS `Amount of communities` 
FROM vk.users

ORDER BY `Amount of send requests`, `Amount of users media`, `Amount of send messages`, `Amount of communities`
LIMIT 10;
-- Получаем 10 пользователей с наименьшей активностью
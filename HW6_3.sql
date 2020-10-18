-- Определяем 10 самых молодых пользователей
SELECT 
* 
FROM vk.profiles
ORDER BY birthday DESC
LIMIT 10;

-- Определяем их данные
SELECT
	*
FROM vk.users
WHERE id in (4, 8, 30, 36, 44, 72, 85, 86, 92, 95);

SELECT
	id,
	user_id,
    (SELECT COUNT(*) FROM likes WHERE likes.media_id = media.id) AS `Amount of likes`
FROM media
WHERE user_id in (4, 8, 30, 36, 44, 72, 85, 86, 92, 95)
GROUP BY user_id
ORDER BY `Amount of likes` desc;

SELECT DISTINCT
*
FROM vk.friend_requests WHERE `status` = 1;

-- Выбираем пользователя 3 у которого наибольшее число подтвержденных запросов
-- Далее ищем того кто больше всего отправлял нашему пользователю сообщения

SELECT 
	id,
    from_user_id,
    COUNT(from_user_id) AS `Amount of messages to user 3`
FROM vk.messages 
WHERE `to_user_id` = 3
GROUP BY from_user_id
ORDER BY `Amount of messages to user 3` DESC;

-- Получается, что больше всего писал пользователю 3 - пользователь под номер 76
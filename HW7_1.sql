-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT 
	id,
    firstname,
    lastname
FROM shop.users
WHERE id in (SELECT user_id FROM shop.orders);
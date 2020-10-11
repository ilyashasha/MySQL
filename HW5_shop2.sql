SELECT distinct
	id,
    `name`,
	date_for_update,
    str_to_date(date_for_update, '%d.%m.%Y %h:%i:%s') AS new_date
FROM shop.users
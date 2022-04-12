SELECT first_name, last_name
FROM users
WHERE first_name LIKE '%ed%';

SELECT first_name, last_name, creation_date
FROM users
WHERE creation_date BETWEEN '24/03/2020' AND '28/03/2020';

SELECT first_name, last_name, document
FROM users
WHERE id_user IN (1, 3);

SELECT first_name, last_name, document
FROM users
WHERE id_user NOT IN (1, 3);
CREATE VIEW users_names AS
    SELECT first_name, last_name, document
    FROM users;

CREATE VIEW clients_names AS
    SELECT name
    FROM clients;
	
CREATE VIEW food_products AS
    SELECT products.name
    FROM products
	LEFT JOIN product_group ON product_group.id_group = products.id_group
	WHERE product_group.name = 'Food';


SELECT *
FROM users_names;

SELECT *
FROM clients_names;

SELECT *
FROM food_products;
SELECT 
	name
	,bills_to_receive.id_client
	,bills_to_receive.id_bills AS conta_a_pagar
	,bills_to_receive.creation_date
FROM 
	clients
	LEFT JOIN bills_to_receive ON clients.id_client = bills_to_receive.id_client
WHERE name LIKE '%ed%';

SELECT 
	name
	,bills_to_receive.id_client
	,bills_to_receive.id_bills AS conta_a_receber
	,bills_to_receive.creation_date
	,sale_header.id_sale
	,sale_header.id_user
FROM 
	clients
	LEFT JOIN bills_to_receive ON clients.id_client = bills_to_receive.id_client
	LEFT JOIN sale_header ON clients.id_client = sale_header.id_client
WHERE name LIKE '%ed%';

SELECT 
	name
	,bills_to_receive.id_client
	,bills_to_receive.id_bills AS conta_a_receber
	,bills_to_receive.creation_date
	,sale_header.id_sale
	,sale_header.id_user
	,users.first_name
FROM 
	clients
	LEFT JOIN bills_to_receive ON clients.id_client = bills_to_receive.id_client
	LEFT JOIN sale_header ON clients.id_client = sale_header.id_client
	LEFT JOIN users ON users.id_user = sale_header.id_user
WHERE name LIKE '%ed%';
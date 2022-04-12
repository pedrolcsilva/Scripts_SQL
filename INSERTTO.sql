

CREATE TABLE public.users (
	"id_user" serial NOT NULL,
	"first_name" varchar(50) NOT NULL,
	"last_name" varchar(50) NOT NULL,
	"document" varchar(14) NOT NULL UNIQUE,
	"zip_code" varchar(9) NOT NULL,
	"phone_ddi" varchar(3) NOT NULL,
	"phone_ddd" varchar(2) NOT NULL,
	"phone_number" varchar(10) NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id_user")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.clients (
	"id_client" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "clients_pk" PRIMARY KEY ("id_client")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.providers (
	"id_providers" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "providers_pk" PRIMARY KEY ("id_providers")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.products (
	"id_produto" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"id_group" serial NOT NULL,
	"id_inventory" serial NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id_produto")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.product_group (
	"id_group" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "product_group_pk" PRIMARY KEY ("id_group")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.sale_header (
	"id_sale" serial NOT NULL,
	"id_client" serial NOT NULL,
	"id_user" serial NOT NULL,
	"id_bills" serial NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "sale_header_pk" PRIMARY KEY ("id_sale")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.sale_Items (
	"id_item" serial NOT NULL,
	"id_sale" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "sale_Items_pk" PRIMARY KEY ("id_item")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.inventory (
	"id_inventory" serial NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("id_inventory")
) WITH (
  OIDS=FALSE
);

CREATE TABLE public.bills_to_receive (
	"id_bills" serial NOT NULL,
	"id_client" serial NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "bills_to_receive_pk" PRIMARY KEY ("id_bills")
) WITH (
  OIDS=FALSE
);

DROP TABLE IF EXISTS bills_to_pay;

CREATE TABLE public.bills_to_pay (
	"id_bills" serial NOT NULL,
	"id_providers" bigint NOT NULL,
	"creation_date" TIMESTAMP NOT NULL,
	"creation_user" serial NOT NULL,
	"update_date" TIMESTAMP NOT NULL,
	"update_user" serial NOT NULL,
	CONSTRAINT "bills_to_pay_pk" PRIMARY KEY ("id_bills")
) WITH (
  OIDS=FALSE
);

ALTER TABLE products ADD CONSTRAINT "products_fk0" FOREIGN KEY ("id_group") REFERENCES "product_group"("id_group");
ALTER TABLE products ADD CONSTRAINT "products_fk1" FOREIGN KEY ("id_inventory") REFERENCES "inventory"("id_inventory");


ALTER TABLE sale_header ADD CONSTRAINT "sale_header_fk0" FOREIGN KEY ("id_client") REFERENCES "clients"("id_client");
ALTER TABLE sale_header ADD CONSTRAINT "sale_header_fk1" FOREIGN KEY ("id_user") REFERENCES "users"("id_user");
ALTER TABLE sale_header ADD CONSTRAINT "sale_header_fk2" FOREIGN KEY ("id_bills") REFERENCES "bills_to_receive"("id_bills");

ALTER TABLE sale_Items ADD CONSTRAINT "sale_Items_fk0" FOREIGN KEY ("id_sale") REFERENCES "sale_header"("id_sale");


ALTER TABLE bills_to_receive ADD CONSTRAINT "bills_to_receive_fk0" FOREIGN KEY ("id_client") REFERENCES "clients"("id_client");

ALTER TABLE bills_to_pay ADD CONSTRAINT "bills_to_pay_fk0" FOREIGN KEY ("id_providers") REFERENCES "providers"("id_providers");


INSERT INTO users 
("first_name", "last_name", "document", "zip_code", "phone_ddi", "phone_ddd", "phone_number", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Pedro', 'Lucas', '19301242123', '23441333', '29', '31', '914892012', '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO users 
("first_name", "last_name", "document", "zip_code", "phone_ddi", "phone_ddd", "phone_number", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Lucas', 'Silva', '13121432423', '25444852', '29', '31', '919852012', '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO clients 
("name", "creation_date", "creation_user", "update_date", "update_user")
Values 	
('Pedro Lucas', '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO clients 
("name", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Lucas Silva', '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO bills_to_receive 
("id_client", "creation_date", "creation_user", "update_date", "update_user")
Values 
(1, '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO bills_to_receive 
("id_client", "creation_date", "creation_user", "update_date", "update_user")
Values 
(2, '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO sale_header
("id_client", "id_user", "id_bills", "creation_date", "creation_user", "update_date", "update_user")
Values 
(1, 1, 1,'25/03/2020', 1, '25/03/2020', 1);

INSERT INTO sale_header
("id_client", "id_user", "id_bills", "creation_date", "creation_user", "update_date", "update_user")
Values 
(2, 2, 2,'25/03/2020', 1, '25/03/2020', 1);

INSERT INTO sale_Items
("id_sale", "name", "creation_date", "creation_user", "update_date", "update_user")
Values 
(1, 'Chocolate','25/03/2020', 1, '25/03/2020', 1);

INSERT INTO sale_Items
("id_sale", "name", "creation_date", "creation_user", "update_date", "update_user")
Values 
(2, 'Biscoito','25/03/2020', 1, '25/03/2020', 1);

INSERT INTO product_group
("name", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Food','25/03/2020', 1, '25/03/2020', 1);

INSERT INTO product_group
("name", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Toy','25/03/2020', 1, '25/03/2020', 1);

INSERT INTO inventory
("creation_date", "creation_user", "update_date", "update_user")
Values 
('25/03/2020', 1, '25/03/2020', 1);

INSERT INTO inventory
("creation_date", "creation_user", "update_date", "update_user")
Values 
('25/03/2020', 1, '25/03/2020', 1);

INSERT INTO products
("name", "id_group", "id_inventory", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Chocolate', 1, 1,'25/03/2020', 1, '25/03/2020', 1);

INSERT INTO products
("name", "id_group", "id_inventory", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Biscoito', 1, 1,'25/03/2020', 1, '25/03/2020', 1);

INSERT INTO providers
("name", "creation_date", "creation_user", "update_date", "update_user")
Values 
('João','25/03/2020', 1, '25/03/2020', 1);

INSERT INTO providers
("name", "creation_date", "creation_user", "update_date", "update_user")
Values 
('Carlos','25/03/2020', 1, '25/03/2020', 1);

TRUNCATE bills_to_pay;

INSERT INTO bills_to_pay
("id_providers", "creation_date", "creation_user", "update_date", "update_user")
Values 
('1', '25/03/2020', 1, '25/03/2020', 1);

INSERT INTO bills_to_pay
("id_providers", "creation_date", "creation_user", "update_date", "update_user")
Values 
('2', '25/03/2020', 1, '25/03/2020', 1);



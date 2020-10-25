CREATE SEQUENCE "service_groups_id_sequence";
CREATE SEQUENCE "group_directions_id_sequence";
CREATE SEQUENCE "category_directions_id_sequence";
CREATE SEQUENCE "user_id_sequence";

CREATE TABLE "user" (
	"id" SERIAL PRIMARY KEY,
	"login" VARCHAR(128) NOT NULL UNIQUE,
	"email" VARCHAR(255) NOT NULL UNIQUE ,
	"password" VARCHAR(128) NOT NULL,
-- 	"action" BOOLEAN DEFAULT FALSE ,
	"role" INT CHECK ("role" IN (0, 1, 2, 3)) DEFAULT 3
	/*
	 * 0 - DEVELOPER
	 * 1 - ADMIN
	 * 2 - MODERATOR
	 * 3 - CLIENT
	 */
    );

-- CREATE TABLE "administration" (
-- 	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
-- 	"name" VARCHAR NOT NULL,
-- 	"surname" VARCHAR NOT NULL,
-- 	"middle_name" VARCHAR NULL,
-- 	"post" VARCHAR NOT NULL
--     );

-- CREATE TABLE "status_client" (
-- 	"id" SERIAL PRIMARY KEY,
-- 	"status" VARCHAR NOT NULL
-- 	);

CREATE TABLE "client" (
	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
-- 	"status_client_id" INTEGER NOT NULL REFERENCES "status_client" ON DELETE RESTRICT
	"client_status" INT NOT NULL CHECK ("client_status" IN (0, 1))
	/*
	 * 0 - PHYSICAL
	 * 1 - LEGAL
	 */
	);

CREATE TABLE "personal_information" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR NOT NULL,
	"surname" VARCHAR NOT NULL,
	"middle_name" VARCHAR,
	"birthday_date" DATE,
	"company_name" VARCHAR,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT

--	CHECK ((name IS NOT NULL AND surname IS NOT NULL AND company_name IS NULL)
--	OR (company_name IS NOT NULL AND name IS NULL AND surname IS NULL)
--	OR (name IS NOT NULL AND surname IS NOT NULL AND company_name IS NOT NULL))
	);

CREATE TABLE "contacts" (
	"id" SERIAL PRIMARY KEY,
	"country_region" VARCHAR NOT NULL,
	"city_department" VARCHAR NOT NULL,
	"street_address" VARCHAR NOT NULL,
	"postcode" TEXT NOT NULL,
	"phone_number" VARCHAR NOT NULL,
-- 	"email" TEXT NOT NULL UNIQUE,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT
	);

CREATE TABLE "payment_information" (
	"id" SERIAL PRIMARY KEY,
	"card_number" INTEGER NOT NULL,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT
	);


CREATE TABLE "cart_of_sale" (
	"id" SERIAL PRIMARY KEY,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT
	);

CREATE TABLE "cart_of_buyer" (
	"id" SERIAL PRIMARY KEY,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT
	);

CREATE TABLE "cart_of_auction" (
	"id" SERIAL PRIMARY KEY,
	"client_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT
	);

-- CREATE TABLE "type_of_auction" (
-- 	"id" SERIAL PRIMARY KEY,
-- -- 	"auction_name" VARCHAR NOT NULL
-- 	"type_of_auction" INT NOT NULL CHECK ("type_of_auction" IN (0, 1, 2, 3))
-- 	/*
-- 	 * 0 - STANDARD
-- 	 * 1 - REVERSIBLE
-- 	 * 2 - LAVRENTIEVSKY
-- 	 * 3 - SCANDINAVIAN
-- 	 */
-- 	);

CREATE TABLE "service_groups"(
	"id" SERIAL PRIMARY KEY,
	"groups_name" VARCHAR NOT NULL
	);

CREATE TABLE "group_directions"(
	"id" SERIAL PRIMARY KEY,
	"direction_name" VARCHAR NOT NULL,
	"service_groups_id" INTEGER NOT NULL REFERENCES "service_groups" ON DELETE RESTRICT
	);

CREATE TABLE "category_directions"(
	"id" SERIAL PRIMARY KEY,
	"category_name" VARCHAR NOT NULL,
	"group_directions_id" INTEGER REFERENCES "group_directions" ON DELETE RESTRICT
	);

CREATE TABLE "lot_cost_details" (
	"id" SERIAL PRIMARY KEY,
	"starting_cost" BIGINT NOT NULL,
	"current_cost" BIGINT NOT NULL,
	"final_cost" BIGINT,
	"bets_number" INTEGER,
	"minimum_rate_step" INTEGER NOT NULL,
	CHECK (minimum_rate_step > (starting_cost/100)),
-- 	"type_of_auction_id" INTEGER NOT NULL REFERENCES "type_of_auction" ON DELETE RESTRICT,
    "type_of_auction" INT NOT NULL CHECK ("type_of_auction" IN (0, 1, 2, 3))
	/*
	 * 0 - STANDARD
	 * 1 - REVERSIBLE
	 * 2 - LAVRENTIEVSKY
	 * 3 - SCANDINAVIAN
	 */
	);

-- CREATE TABLE "lot_state" (
-- 	"id" SERIAL PRIMARY KEY,
-- -- 	"state_name" VARCHAR NOT NULL
-- 	"state" INT NOT NULL CHECK ("state" IN (0, 1, 2, 3))
-- 	/*
-- 	 * 0 - ACTIVE
-- 	 * 1 - CLOSED
-- 	 * 2 - SOLD
-- 	 * 3 - MODERATION
-- 	 */
-- 	);

CREATE TABLE "lot" (
	"id" SERIAL PRIMARY KEY,
	"location_lot_id" INTEGER NOT NULL REFERENCES "category_directions" ON DELETE RESTRICT,
	"creator_id" INTEGER NOT NULL REFERENCES "client" ON DELETE RESTRICT ,
	"name_of_lot" VARCHAR NOT NULL,
	"comments_on_the_lot" VARCHAR,
	"lot_cost_details_id" INTEGER NOT NULL REFERENCES "lot_cost_details" ON DELETE RESTRICT ,
	"lot_placement_date" DATE NOT NULL,
	"lot_closing_date" DATE,
-- 	"lot_state_id" INTEGER NOT NULL REFERENCES "lot_state" ON DELETE CASCADE
    "state" INT NOT NULL CHECK ("state" IN (0, 1, 2, 3))
	/*
	 * 0 - ACTIVE
	 * 1 - CLOSED
	 * 2 - SOLD
	 * 3 - MODERATION
	 */

	);

CREATE TABLE "photo" (
	"id" SERIAL PRIMARY KEY,
	"url" VARCHAR NOT NULL,
	"lot_id" INTEGER REFERENCES "lot" ON DELETE RESTRICT ,
	"client_id" INTEGER REFERENCES "client" ON DELETE RESTRICT,
-- 	UNIQUE ("lot_id", "client_id"),
	CHECK ((lot_id IS NOT NULL AND client_id IS NULL)
	OR (client_id IS NOT NULL AND lot_id IS NULL))
	);


-- CREATE TABLE "products_services"(
-- 	"id" SERIAL PRIMARY KEY,
-- 	"product_name" TEXT NOT NULL,
--     "category_directions_id" integer REFERENCES "category_directions" ON DELETE RESTRICT
-- 	);

-- CREATE TABLE "category_directions_vs_products_services" (
-- 	"category_directions_id" INTEGER NOT NULL REFERENCES "types_of_services" ON DELETE RESTRICT,
-- 	"products_services_id" INTEGER NOT NULL REFERENCES "products_services" ON DELETE RESTRICT,
-- 	UNIQUE ("category_directions_id", "products_services_id")
-- 	);

CREATE TABLE "cart_lots" (
	"lot_id" INTEGER REFERENCES "lot" ON DELETE RESTRICT,
	"cart_of_sale_id" INTEGER  REFERENCES "cart_of_sale" ON DELETE RESTRICT,
	"cart_of_buyer_id" INTEGER  REFERENCES "cart_of_buyer" ON DELETE RESTRICT,
	"cart_of_auction_id" INTEGER  REFERENCES "cart_of_auction" ON DELETE RESTRICT,
	UNIQUE ("lot_id", "cart_of_sale_id", "cart_of_buyer_id", "cart_of_auction_id"),
	CHECK ((lot_id IS NOT NULL AND cart_of_sale_id IS NOT NULL AND cart_of_buyer_id IS NULL AND cart_of_auction_id IS NULL)
	OR (lot_id IS NOT NULL AND cart_of_sale_id IS NULL AND cart_of_buyer_id IS NOT NULL AND cart_of_auction_id IS NULL)
	OR (lot_id IS NOT NULL AND cart_of_sale_id IS NULL AND cart_of_buyer_id IS NULL AND cart_of_auction_id IS NOT NULL))
	);

CREATE TABLE "lot_placement" (
	"lot_id" INTEGER NOT NULL REFERENCES "lot" ON DELETE RESTRICT,
--	"service_groups_id" INTEGER NOT NULL REFERENCES "service_groups" ON DELETE RESTRICT,
--	"group_directions_id" INTEGER NOT NULL REFERENCES "group_directions" ON DELETE RESTRICT,
	"category_directions_id" INTEGER NOT NULL REFERENCES "category_directions" ON DELETE RESTRICT,
-- 	"products_services_id" INTEGER REFERENCES "products_services" ON DELETE RESTRICT,
-- 	CHECK ((lot_id IS NOT NULL AND cart_of_sale_id IS NOT NULL AND cart_of_buyer_id IS NULL AND cart_of_auction_id IS NULL)
--	OR (lot_id IS NOT NULL AND cart_of_sale_id IS NULL AND cart_of_buyer_id IS NOT NULL AND cart_of_auction_id IS NULL)
--	OR (lot_id IS NOT NULL AND cart_of_sale_id IS NULL AND cart_of_buyer_id IS NULL AND cart_of_auction_id IS NOT NULL),
-- 	UNIQUE ("lot_id", "service_groups_id", "group_directions_id", "types_of_services_id")
 	UNIQUE ("lot_id", "category_directions_id")
 	);



--CREATE SEQUENCE "autor_id_sequence";
--CREATE TABLE "author" (
----	"id" INTEGER PRIMARY KEY DEFAULT nextval('autor_id_sequence')
--	"id" SERIAL PRIMARY KEY,
--	"name" TEXT NOT NULL,
--	"surname" TEXT NOT NULL
--	);
--
--CREATE TABLE "book" (
--	"id" SERIAL PRIMARY KEY,
--	"title" TEXT NOT NULL,
--	"publish_year" INTEGER NOT NULL,
--	"pages" INTEGER NOT NULL
--);
--
--CREATE TABLE "author_vs_book" (
--	"author_id" INTEGER NOT NULL REFERENCES "author" ON DELETE RESTRICT,
--	"book_id" INTEGER NOT NULL REFERENCES "book" ON DELETE RESTRICT,
--	UNIQUE ("author_id", "book_id")
--);
--
--CREATE TABLE "user" (
--	"id" SERIAL PRIMARY KEY,
--	"login" TEXT NOT NULL UNIQUE,
--	"password" CHAR(128) NOT NULL,
--	"role" SMALLINT NOT NULL CHECK ("role" IN (0, 1, 2, 3, 4))
--	/*
--	 * 0 - ADMIN
--	 * 1 - ARCHIVARIUS
--	 * 2 - REGISTRATOR
--	 * 3 - LIBRARIAN
--	 * 4 - READER
--	 */
--);
--
--CREATE TABLE "reader" (
--	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
--	"name" TEXT NOT NULL,
--	"surname" TEXT NOT NULL,
--	"address" TEXT NOT NULL
--);
--
--CREATE TABLE "reader_phone" (
--	"id" SERIAL PRIMARY KEY,
--	"reader_id" INTEGER NOT NULL REFERENCES "reader" ON DELETE CASCADE,
--	"number" TEXT NOT NULL
--);
--
--CREATE TABLE "librarian" (
--	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
--	"name" TEXT NOT NULL,
--	"surname" TEXT NOT NULL,
--	"post" TEXT NOT NULL
--);
--
--CREATE TABLE "usage" (
--	"id" SERIAL PRIMARY KEY,
--	"book_id" INTEGER NOT NULL REFERENCES "book" ON DELETE RESTRICT,
--	"reader_id" INTEGER NOT NULL REFERENCES "reader" ON DELETE RESTRICT,
--	"give_date" DATE NOT NULL,
--	"plan_return_date" DATE NOT NULL,
--	"return_date" DATE DEFAULT NULL,
--	"give_librarian_id" INTEGER NOT NULL REFERENCES "librarian" ON DELETE RESTRICT,
--	"return_librarian_id" INTEGER REFERENCES "librarian" ON DELETE RESTRICT,
--	CHECK ("plan_return_date" > "give_date")
--);


--CREATE SEQUENCE "lot_id_sequence";

--CREATE TABLE "service_groups"(
--	"id" SERIAL PRIMARY KEY,
--	"groups_name" TEXT NOT NULL
--	);

--CREATE TABLE "group_directions"(
--	"id" SERIAL PRIMARY KEY,
--	"direction_name" TEXT NOT NULL,
--	"service_groups_id" integer NOT NULL REFERENCES "service_groups" ON DELETE cascade
--	);
	
--CREATE TABLE "category_directions"(
--	"id" SERIAL PRIMARY KEY,
--	"category_name" TEXT NOT NULL,
--	"group_directions_id" integer REFERENCES "group_directions" ON DELETE RESTRICT
--	);
	
-- CREATE TABLE "products_services"(
-- 	"id" SERIAL PRIMARY KEY,
-- 	"product_name" TEXT NOT NULL,
--     "category_directions_id" integer REFERENCES "category_directions" ON DELETE RESTRICT
-- 	);
	
-- CREATE TABLE "category_directions_vs_products_services" (
-- 	"category_directions_id" INTEGER NOT NULL REFERENCES "types_of_services" ON DELETE RESTRICT,
-- 	"products_services_id" INTEGER NOT NULL REFERENCES "products_services" ON DELETE RESTRICT,
-- 	UNIQUE ("category_directions_id", "products_services_id")
-- 	);

--CREATE TABLE "lot_placement" (
--	"id" SERIAL PRIMARY KEY,
--	"service_groups_id" INTEGER NOT NULL REFERENCES "service_groups" ON DELETE RESTRICT,
--	"group_directions_id" INTEGER NOT NULL REFERENCES "group_directions" ON DELETE RESTRICT,
--	"types_of_services_id" INTEGER NOT NULL REFERENCES "types_of_services"(id) ON DELETE RESTRICT
-- 	"products_services_id" INTEGER REFERENCES "products_services" ON DELETE RESTRICT,
-- 	CHECK ((group_directions_id IS NOT NULL AND types_of_services_id IS NULL AND products_services_id IS NULL)
-- 	OR (types_of_services_id IS NOT NULL AND group_directions_id IS NULL AND products_services_id IS NULL)
-- 	OR (products_services_id IS NOT NULL AND group_directions_id IS NULL AND types_of_services_id IS NULL)),
-- 	UNIQUE ( "group_directions_id", "types_of_services_id", "products_services_id")
-- 	);

--CREATE TABLE "user" (
--	"id" SERIAL PRIMARY KEY,
--	"login" TEXT NOT NULL UNIQUE,
--	"password" CHAR(128) NOT NULL,
--	"role" SMALLINT NOT NULL CHECK ("role" IN (0, 1, 2, 3))
--	/*
--	 * 0 - ADMIN
--	 * 1 - DEVELOPER
--	 * 2 - MODERATOR
--	 * 3 - CUSTOMER
--	 */
--	);

--CREATE TABLE "user_person" (
--	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
--	"status_person" TEXT NULL,
--	"personal_page_id" INT NOT NULL REFERENCES "personal_page" ON DELETE RESTRICT
--	);

--CREATE TABLE "personal_information" (
--	"id" SERIAL PRIMARY KEY,
--	"name" TEXT,
--	"surname" TEXT,
--	"middle_name" TEXT,
--	"company_name" TEXT,
--	CHECK ((name IS NOT NULL AND surname IS NOT NULL AND company_name IS NULL)
--	OR (company_name IS NOT NULL AND name IS NULL AND surname IS NULL)
--	OR (name IS NOT NULL AND surname IS NOT NULL AND company_name IS NOT NULL))
--	);
	
--CREATE TABLE "contacts" (
--	"id" SERIAL PRIMARY KEY,
--	"country_region" TEXT NOT NULL,
--	"city_department" TEXT NOT NULL,
--	"street_address" TEXT NOT NULL,
--	"phone_number" TEXT NOT NULL,
--	"email" TEXT NOT NULL,
--	UNIQUE("email")
--	);
	
--CREATE TABLE "payment_information" (
--	"id" SERIAL PRIMARY KEY,
--	"card_number" INTEGER
--	);

--CREATE TABLE "photo" (
--	"id" SERIAL PRIMARY KEY,
--	"photo" bytea NULL
--	);
	
--CREATE TABLE "personal_page" (
--	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
--	"photo_id" INTEGER REFERENCES "photo" ON DELETE RESTRICT,
--	"personal_information_id" INTEGER NOT NULL REFERENCES "personal_information" ON DELETE RESTRICT,
--	"contacts_id" INTEGER REFERENCES "contacts" ON DELETE RESTRICT,
----	"page_seller_lots_id" INTEGER,
----	"page_buyer_lots_id" INTEGER,
----	"page_auction_lots_id" INTEGER,
----	"page_messeges_id" INTEGER,
--	"payment_information_id" INTEGER REFERENCES "payment_information" ON DELETE RESTRICT,
--	"rating" INTEGER
--	);

--CREATE TABLE "type_of_lot" (
--	"id" SERIAL PRIMARY KEY,
--	"type_name" TEXT NOT NULL
--	);
	
--CREATE TABLE "lot_details" (
--	"id" SERIAL PRIMARY KEY,
--	"type_of_lot_id" INTEGER NOT NULL REFERENCES "type_of_lot" ON DELETE RESTRICT,
--	"starting_cost" BIGINT NOT NULL,
--	"current_cost" BIGINT NOT NULL,
--	"final_cost"BIGINT NOT NULL,
--	"bets_count" INTEGER,
--	"minimum_rate_step" INTEGER NOT NULL,
--	CHECK (minimum_rate_step > (starting_cost/100))
--	);
	
--CREATE TABLE "lot_state" (
--	"id" SERIAL PRIMARY KEY,
--	"state_name" TEXT NOT NULL
--	);
	
--CREATE TABLE "create_lot" (
--	"id" SERIAL PRIMARY KEY,
--	"creator_id" INTEGER NOT NULL REFERENCES "user_person" ON DELETE RESTRICT,
--	"photo_id" INTEGER REFERENCES "photo" ON DELETE RESTRICT,
--	"Short_name_of_lot" TEXT NOT NULL,
--	"lot_placement_id" INTEGER NOT NULL REFERENCES "lot_placement" ON DELETE RESTRICT,
--	"comments_on_the_lot" TEXT,
--	"lot_details_id" INTEGER NOT NULL REFERENCES "lot_details" ON DELETE RESTRICT,
--	"lot_placement_date" DATE NOT NULL,
--	"lot_closing_date" DATE NOT NULL,
--	"lot_state_id" INTEGER REFERENCES "lot_state" ON DELETE RESTRICT
--	);
	
--CREATE SEQUENCE "autor_id_sequence";
--CREATE TABLE "author" (
----	"id" INTEGER PRIMARY KEY DEFAULT nextval('autor_id_sequence')
--	"id" SERIAL PRIMARY KEY,
--	"name" TEXT NOT NULL,
--	"surname" TEXT NOT NULL
--	);
--
--CREATE TABLE "book" (
--	"id" SERIAL PRIMARY KEY,
--	"title" TEXT NOT NULL,
--	"publish_year" INTEGER NOT NULL,
--	"pages" INTEGER NOT NULL
--);
--
--CREATE TABLE "author_vs_book" (
--	"author_id" INTEGER NOT NULL REFERENCES "author" ON DELETE RESTRICT,
--	"book_id" INTEGER NOT NULL REFERENCES "book" ON DELETE RESTRICT,
--	UNIQUE ("author_id", "book_id")
--);
--
--CREATE TABLE "user" (
--	"id" SERIAL PRIMARY KEY,
--	"login" TEXT NOT NULL UNIQUE,
--	"password" CHAR(128) NOT NULL,
--	"role" SMALLINT NOT NULL CHECK ("role" IN (0, 1, 2, 3, 4))
--	/*
--	 * 0 - ADMIN
--	 * 1 - ARCHIVARIUS
--	 * 2 - REGISTRATOR
--	 * 3 - LIBRARIAN
--	 * 4 - READER
--	 */
--);
--
--CREATE TABLE "reader" (
--	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
--	"name" TEXT NOT NULL,
--	"surname" TEXT NOT NULL,
--	"address" TEXT NOT NULL
--);
--
--CREATE TABLE "reader_phone" (
--	"id" SERIAL PRIMARY KEY,
--	"reader_id" INTEGER NOT NULL REFERENCES "reader" ON DELETE CASCADE,
--	"number" TEXT NOT NULL
--);
--
--CREATE TABLE "librarian" (
--	"id" INTEGER PRIMARY KEY REFERENCES "user" ON DELETE CASCADE,
--	"name" TEXT NOT NULL,
--	"surname" TEXT NOT NULL,
--	"post" TEXT NOT NULL
--);
--
--CREATE TABLE "usage" (
--	"id" SERIAL PRIMARY KEY,
--	"book_id" INTEGER NOT NULL REFERENCES "book" ON DELETE RESTRICT,
--	"reader_id" INTEGER NOT NULL REFERENCES "reader" ON DELETE RESTRICT,
--	"give_date" DATE NOT NULL,
--	"plan_return_date" DATE NOT NULL,
--	"return_date" DATE DEFAULT NULL,
--	"give_librarian_id" INTEGER NOT NULL REFERENCES "librarian" ON DELETE RESTRICT,
--	"return_librarian_id" INTEGER REFERENCES "librarian" ON DELETE RESTRICT,
--	CHECK ("plan_return_date" > "give_date")
--);
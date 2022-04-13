CREATE SCHEMA food_store
    AUTHORIZATION postgres;


CREATE TABLE IF NOT EXISTS food_store.product
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    product character varying(50),
    stock character varying(50) DEFAULT 0,
    amount double precision NOT NULL DEFAULT 0.0,
    available_for_selling boolean NOT NULL DEFAULT false,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE food_store.user
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hashed_password character varying(50),
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS food_store.payment
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    amount double precision NOT NULL DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT payments_pkey PRIMARY KEY (id)
);


ALTER TABLE food_store.payment ADD CONSTRAINT fk_payments_user FOREIGN KEY (user_id) REFERENCES food_store.user (id);
ALTER TABLE food_store.payment ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES food_store.product (id);



-- ALTER TABLE food_store ALTER COLUMN product TYPE integer USING (trim(stock)::integer);



-- ALTER TABLE food_store.product ALTER COLUMN stock DROP NOT NULL;

CREATE INDEX idx_food_store_user_id ON food_store.user (id);
CREATE INDEX idx_food_store_user_email ON food_store.user (email);
CREATE INDEX idx_food_store_product_id ON food_store.product (id);
CREATE INDEX idx_food_store_payment_id ON food_store.payment (id);

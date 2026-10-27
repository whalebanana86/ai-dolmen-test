CREATE TABLE shop.customers (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
    email character varying(255) NOT NULL,
    name text NOT NULL,
    joined_on date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT customers_email_key UNIQUE (email),
    CONSTRAINT customers_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE shop.customers IS '가입한 고객';
COMMENT ON COLUMN shop.customers.joined_on IS '가입한 날';

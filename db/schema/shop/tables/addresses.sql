CREATE TABLE shop.addresses (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
    customer_id bigint NOT NULL,
    label text DEFAULT '집'::text NOT NULL,
    line1 text NOT NULL,
    city text NOT NULL,
    CONSTRAINT addresses_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES shop.customers(id) ON DELETE CASCADE,
    CONSTRAINT addresses_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE shop.addresses IS '고객의 배송지. 고객을 지우면 함께 지워짐';

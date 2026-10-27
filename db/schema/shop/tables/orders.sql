CREATE TABLE shop.orders (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
    customer_id bigint NOT NULL,
    shipping_address_id bigint,
    status text DEFAULT 'pending'::text NOT NULL,
    ordered_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES shop.customers(id) ON DELETE RESTRICT,
    CONSTRAINT orders_pkey PRIMARY KEY (id),
    CONSTRAINT orders_shipping_address_id_fkey FOREIGN KEY (shipping_address_id) REFERENCES shop.addresses(id) ON DELETE SET NULL,
    CONSTRAINT orders_status_check CHECK (status = ANY (ARRAY['pending'::text, 'paid'::text, 'shipped'::text, 'cancelled'::text]))
);

CREATE INDEX orders_customer_idx ON shop.orders USING btree (customer_id);

COMMENT ON TABLE shop.orders IS '주문. 주문이 있는 고객은 지울 수 없음';

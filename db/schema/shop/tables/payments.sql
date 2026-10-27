CREATE TABLE shop.payments (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
    order_id bigint NOT NULL,
    amount numeric(12,2) NOT NULL,
    paid_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES shop.orders(id),
    CONSTRAINT payments_order_id_key UNIQUE (order_id),
    CONSTRAINT payments_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE shop.payments IS '결제. 주문 하나에 결제 하나';

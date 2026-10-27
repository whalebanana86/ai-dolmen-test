CREATE TABLE shop.shipments (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
    order_id bigint NOT NULL,
    line_no integer NOT NULL,
    shipped_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT shipments_order_id_line_no_fkey FOREIGN KEY (order_id, line_no) REFERENCES shop.order_items(order_id, line_no) ON DELETE CASCADE,
    CONSTRAINT shipments_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE shop.shipments IS '주문 항목별 배송. (order_id, line_no) 복합 외래 키';

CREATE TABLE shop.order_items (
    order_id bigint NOT NULL,
    line_no integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES shop.orders(id) ON DELETE CASCADE,
    CONSTRAINT order_items_pkey PRIMARY KEY (order_id, line_no),
    CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES shop.products(id),
    CONSTRAINT order_items_quantity_check CHECK (quantity > 0)
);

COMMENT ON TABLE shop.order_items IS '주문 항목';

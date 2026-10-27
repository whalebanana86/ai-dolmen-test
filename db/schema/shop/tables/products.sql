CREATE TABLE shop.products (
    id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    category_id integer,
    sku text NOT NULL,
    name text NOT NULL,
    price numeric(12,2) NOT NULL,
    CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES shop.categories(id) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT products_pkey PRIMARY KEY (id),
    CONSTRAINT products_price_check CHECK (price >= 0::numeric),
    CONSTRAINT products_sku_key UNIQUE (sku)
);

COMMENT ON TABLE shop.products IS '판매 상품';

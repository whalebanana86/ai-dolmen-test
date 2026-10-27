CREATE TABLE shop.categories (
    id integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    parent_id integer,
    name text NOT NULL,
    CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES shop.categories(id) ON DELETE SET NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE shop.categories IS '상품 분류. parent_id가 상위 분류를 가리킴';

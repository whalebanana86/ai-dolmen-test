CREATE TABLE shop.reviews (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
    product_id integer NOT NULL,
    customer_id bigint,
    rating smallint NOT NULL,
    body text,
    CONSTRAINT reviews_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES shop.customers(id) ON DELETE SET NULL,
    CONSTRAINT reviews_pkey PRIMARY KEY (id),
    CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES shop.products(id) ON DELETE CASCADE,
    CONSTRAINT reviews_rating_check CHECK (rating >= 1 AND rating <= 5)
);

COMMENT ON TABLE shop.reviews IS '상품 리뷰. 고객이 탈퇴해도 리뷰는 남음';

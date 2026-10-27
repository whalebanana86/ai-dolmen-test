CREATE TABLE shop.coupons (
    code text NOT NULL,
    percent_off integer NOT NULL,
    expires_on date,
    CONSTRAINT coupons_percent_off_check CHECK (percent_off >= 1 AND percent_off <= 100),
    CONSTRAINT coupons_pkey PRIMARY KEY (code)
);

COMMENT ON TABLE shop.coupons IS '할인 쿠폰. 다른 테이블과 관계 없음';

CREATE VIEW shop.order_totals AS
 SELECT o.id AS order_id,
    c.name AS customer,
    sum(i.quantity::numeric * i.unit_price) AS total
   FROM shop.orders o
     JOIN shop.customers c ON c.id = o.customer_id
     JOIN shop.order_items i ON i.order_id = o.id
  GROUP BY o.id, c.name;

COMMENT ON VIEW shop.order_totals IS '주문별 합계';

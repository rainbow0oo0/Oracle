
// 실습 6-2 
insert into "Order" values(1, 'c102', 3, 2, '2023-01-01 13:15:10');
insert into "Order" values(2, 'c101', 4, 1, '2023-01-01 13:15:12');
insert into "Order" values(3, 'c102', 1, 1, '2023-01-01 13:15:14');
insert into "Order" values(4, 'c103', 5, 5, '2023-01-01 13:15:16');
insert into "Order" values(5, 'c105', 2, 1, '2023-01-01 13:15:18');

// 실습 6-3
// 모든 주문의 주문번호, 주문한 고객명, 주문한 상품명, 주문 수량, 주문일을 조회하시오.
SELECT 
    o.orderNo,
    o.orderId,
    c.name AS customerName,
    p.prodName,
    o.orderCount,
    o.orderDate
FROM   "Order" o
JOIN   Customer c ON o.orderId = c.custId
JOIN   Product p ON o.orderProduct = p.prodNo;

// 김유신이 주문한 상품의 주문번호, 상품번호, 상품명, 가격, 주문수량, 주문일을 조회하시오.
SELECT 
    o.orderNo,
    p.prodNo,
    p.prodName,
    p.price,
    o.orderCount,
    o.orderDate
FROM   "Order" o
JOIN   Customer c ON o.orderId = c.custId
JOIN   Product p ON o.orderProduct = p.prodNo
WHERE  c.name = '김유신';

// 주문한 상품의 총 주문 금액을 조회하시오
SELECT p.prodName,
       SUM(p.price * o.orderCount) AS "총 주문 금액"
FROM   "Order" o
JOIN   Product p ON o.orderProduct = p.prodNo
GROUP BY p.prodName;






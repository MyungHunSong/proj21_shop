-- jongyoon test script
show tables;
select *
  from address;
select *
  from admin;
select *
  from cart;
select *
  from `member`;
select *
  from `order`;
select *
  from pro_img;
select *
  from product;
select *
  from qna;
select *
  from re_reply;
select *
  from review;
 
-- 만약 주문 수 가 0이면 false 아니면 true
select if(count(*)=0,'false','true')
  from `order`;

select *
  from `order`;
 
-- 총 판매 금액
select sum(order_pro_quantity * order_price)
  from `order`;
 
-- 총 주문 건 수
select count(distinct order_num)
  from `order`;

-- 총 주문 수
select count(*)
  from `order`;
-- 배송 준비 중 수 
select count(*)
  from `order`
 where delivery_status='배송준비중';
-- 배송 중 수 
select count(*)
  from `order`
 where delivery_status='배송 중';
-- 배송 완료 수
select count(*)
  from `order`
 where delivery_status='배송 완료';
-- 환불 완료 수
select count(*)
  from `order` 
 where delivery_status='환불 완료';
-- 환불 대기 수
select count(*)
  from `ORDER`
 where delivery_status='환불 대기중';
-- 총 주문
-- 모든 환불완료





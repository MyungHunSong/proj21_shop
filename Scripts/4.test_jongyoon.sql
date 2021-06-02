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


-- 총 평균
-- 총 주문 수
-- 총 주문
-- 모든 환불완료





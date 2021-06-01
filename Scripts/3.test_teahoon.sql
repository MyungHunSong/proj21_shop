-- LEE TaeHoon TEST scripts
show tables;

select *
  from cart;
select *
  from member;
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
select *
  from Address;
select *
  from admin;
select *
  from `order`;
 
-- 제품 삭제
delete
  from product
 where pro_category <=8000;
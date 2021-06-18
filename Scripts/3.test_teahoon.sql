-- LEE TaeHoon TEST scripts
show tables;
select *
  from cart;
select *
  from member;
select *
  from product; 
 select *
  from pro_img;
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

-- 제품 전체 검색(제품, 제품 이미지 조인문)
DROP VIEW productall;

select *
  from product 
where pro_num  like '103%';

select * from productall where pro_img_state = 1 and pro_size = 1;

select p.pro_num,pro_category,pro_name,pro_price,pro_content,pro_salesrate ,pro_cre_date,pro_status,pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount ,pro_img_code,pro_imagefilename,pro_img_state 
  from product p join pro_img i on p.pro_num = i.pro_num 
where p.pro_num like CONCAT(103,'%');

update pro_img 
	set pro_img_state = 0
where pro_num  > 1000;


CREATE VIEW productall
as
select p.pro_num,pro_category,pro_name,pro_price,pro_content,pro_salesrate,pro_cre_date,pro_status,pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount
		   ,pro_img_code,pro_imagefilename,pro_img_state
  from product p join pro_img i on p.pro_num = i.pro_num;
 

select pro_num,pro_category,pro_name,pro_price,pro_content,pro_salesrate,pro_cre_date,pro_status,pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount,pro_img_code,pro_imagefilename,pro_img_state 
  from productAll where pro_img_state = 1;

select * 
  from productall
where pro_img_state =1 and pro_num = 111;

-- 제품 클릭시 조회수 +1
update product 
      set pro_hits = pro_hits - 1  
 where pro_num = 111;      

select * from product p where pro_num = 111;
-- 제품 삭제
delete
  from product
 where pro_category <= 7000;
 
-- 장바구니 
desc cart;

-- 장바구니 회원 아이디로 검색후 리스트 목록 보여주기
select cart_num, c.cart_member_id, c.cart_pro_num, cart_pro_quantity, p.pro_imagefilename, p.pro_name, p.pro_price, p.pro_size, p.pro_salesrate
  from cart c join productall p on c.cart_pro_num = p.pro_num 
where cart_member_Id ='test01';

select * from productall;

select * from cart;

select * from cart where cart_pro_num  like '%';

-- 장바구니 추가
INSERT INTO cart
		(cart_member_Id, cart_pro_num, cart_pro_quantity)
values
		('test01', 1111, 1);


-- 장바구니 삭제	
/*장바구니 개별삭제*/
delete 
   from cart
where cart_num = 110

/*장바구니 여러개 한번에 삭제*/
delete 
  from cart
where cart_num in (100);

/*장바구니 추가 시 이미 있는 제품인 경우 수량 증가*/

select * 
  from cart
where cart_pro_num = 4073 and cart_member_Id = 'test01';

select cart_num, c.cart_member_id, c.cart_pro_num, cart_pro_quantity, p.pro_imagefilename, p.pro_name, p.pro_price,p.pro_size, p.pro_salesrate 
  from cart c join productall p on c.cart_pro_num = p.pro_num
where cart_num = 149;

select cart_num, c.cart_member_id, c.cart_pro_num, cart_pro_quantity, p.pro_imagefilename, p.pro_name, p.pro_price,p.pro_size, p.pro_salesrate 
  from cart c join productall p on c.cart_pro_num = p.pro_num
where cart_member_Id = 'test01';

/*장바구니에서 선택한 제품만 주문페이지로 검색(이동)*/
select cart_num, c.cart_member_id, c.cart_pro_num, cart_pro_quantity, p.pro_imagefilename, p.pro_name, p.pro_price,p.pro_size, p.pro_salesrate 
  from cart c join productall p on c.cart_pro_num = p.pro_num
WHERE cart_num in (182,187);

select cart_num, c.cart_member_id, c.cart_pro_num, cart_pro_quantity, p.pro_imagefilename, p.pro_name, p.pro_price,p.pro_size, p.pro_salesrate 
  from cart c join productall p on c.cart_pro_num = p.pro_num 
where cart_num = 212;		  

/*제품주문*/
select * from member;

/*회원포인트 부여*/
update `member` 
       set  m_point = m_point + 50 , m_total_buy = m_total_buy + 5000 , m_total_order = m_total_order + 1
 where  m_id = 'test01' ;    

/*새로운 주소 등록*/
/*동일한 주소 있나 검색후 null 이면 새로운 주소로 등록*/
select addr_num,m_id,m_addr1,m_addr2,m_addr3 
  from address
where m_id = 'test02' and m_addr1 = 746858 and m_addr2 = '대구광역시 남구 봉덕동 이천로 51' and m_addr3 = '3층';

INSERT INTO proj21_shop.address
			(m_id,  m_addr1, m_addr2, m_addr3)
values
			('test01', 746858, '대구광역시 남구 봉덕동 이천로 51', '3층');

/*주문 테이블에 제품 등록*/
SELECT MAX(order_pro_num)+1 FROM `order`;

INSERT INTO proj21_shop.`order`
(order_pro_num,order_member_id, pro_num, order_member_name, order_pro_quantity, order_price, order_discount, 
 receiver_name, receiver_tel1, receiver_tel2, delivery_addr1, delivery_addr2, delivery_addr3, request_to_delivery, who_pay, which_bank)
values
(1,'test01', 6163, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
(1,'test01', 1033, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민');

/*팔린 제품 수량 만큼 제품 재고 감소*/
select * from product where pro_num = 6163;
update product 
	   set pro_quantity = pro_quantity + 10 , pro_sold = pro_sold +  1
 where pro_num = 6163;	   

select * from `order`;
select * from `member`;

/*주문 하고 난후 장바구니 삭제*/

delete 
 from `order` ;


delete 
   from cart 
where cart_member_Id = ? and cart_pro_num = ?;

select pro_num 
  from product
where pro_num = ?;
  

/*주문 검색*/

select * from `order` o ;

select order_pro_num ,order_member_id,o2.pro_num,order_member_name,order_pro_quantity,order_price,order_discount,receiver_name,receiver_tel1,receiver_tel2,delivery_addr1,delivery_addr2,delivery_addr3,delivery_status,request_to_delivery,order_date,who_pay,which_bank,(p2.pro_price*order_pro_quantity)-order_discount
  from `order` o2 join product p2 on o2.pro_num = p2.pro_num 
where order_member_id = 'test01';

select order_pro_num ,p2.pro_name ,p2.pro_price 
  from `order` o2 join product p2 on o2.pro_num = p2.pro_num 
where order_member_id = 'test01';

/*주문하기 마지막 카트번호 가져와서 바로 넣기*/
select * from cart;
select * from cart order by cart_num desc limit 1;  

/*주문하기 마지막 주문번호 가져와서 바로 넣기*/
select order_pro_num 
  from `order` order by order_pro_num 
  desc limit 1
  
/*메인화면 바로가기 메뉴들*/
/*mostview : 최다조회수*/
select * 
  from productall
order by  pro_hits desc limit 6;

select * 
  from productall
where pro_size like '%3' 
order by  pro_status = '신상' desc limit 6; 

/*new 새로나온순*/
select * 
  from productall
where pro_size like '%3' 
order by  pro_status = '신상' desc limit 6; 

/*best*/
select * 
  from productall
where pro_size like '%3' 
order by  pro_status = '최고' desc limit 6; 

/*sale*/
select * 
  from productall
where pro_size like '%3' 
order by  pro_status = '세일' desc limit 6; 

/*recommend*/
select * 
  from productall
where pro_size like '%3' 
order by  pro_status = '추천' desc limit 6; 


-- 후기 작성
INSERT INTO review
(pro_num, re_member, re_content, re_image, re_image2, re_stars)
values
(6163, 'test02', '폭신폭신한게 따뜻하네요.', 'review_test2.jpg', 'review_test2.jpg', 5);

-- 후기 목록(제품별)
select r.re_num, r.pro_num, r.re_member, r.re_content, r.re_image,re_image2,re_date,re_stars, p.pro_name, p.pro_imagefilename, p.pro_size 
  from review r join productall p on r.pro_num = p.pro_num 
where r.pro_num like CONCAT(616,'%');

select r.pro_num 
  from review r join productall p on r.pro_num = p.pro_num 
where pro_num = 6163;  

-- 후기 댓글
/*후기 댓글 리스트*/
select re_rep_num,re_num,re_rep_member,re_rep_content,re_rep_date
  from re_reply
where re_num = 1
order by re_rep_num;

/*댓글 작성*/
insert 
   into re_reply
   	 	  (re_num, re_rep_member, re_rep_content)
values (1,'test01','후기내용쓰는곳');

/*댓글 수정*/
update re_reply 
      set re_rep_content = '후기수정', re_rep_date = now() 
 where re_rep_num = 2;       
 
/*댓글 삭제*/
delete 
  from re_reply 
where re_rep_num = 2;


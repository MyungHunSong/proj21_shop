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

-- ----------------------------------------------------
-- AdminMember
-- ----------------------------------------------------

-- 총 회원수
SELECT count(*)
FROM MEMBER;

-- 남성 회원수
SELECT count(*)
  FROM `member`
 WHERE m_gender = 0;

-- 여성 회원수
SELECT count(*)
  FROM `member`
 WHERE m_gender = 1;

-- 회원 이름으로 검색
SELECT count(*)
  FROM `member`
 WHERE m_name like CONCAT('%','종','%');

-- 
SELECT count(*)
  FROM `member`
 WHERE m_name like CONCAT('%',#{keyword},'%');

/*
 [MySQL]
title like CONCAT('%',#{keyword},'%'
*/

select *
  from `member`;

SELECT m_id, m_passwd, m_name, m_phone, m_birthday, m_gender, m_addr1, m_addr2, m_addr3, m_question
	 , m_answer, m_email, m_join, m_point, m_total_buy, m_total_order, m_total_login, m_exit
	 
SELECT
	*
FROM
	(
	SELECT
		ROWNUM AS recNum,
		m_id,
		m_name,
		m_gender,
		m_point,
		m_rank,
		m_cre_date,
		m_lately_date,
		m_total_order,
		m_total_buy,
		m_saving
	FROM
		(
		SELECT
			member_code,
			member_id,
			member_name,
			member_gender,
			member_point,
			member_rank,
			member_cre_date,
			member_lately_date,
			member_total_order,
			member_total_buy,
			member_saving
		FROM
			`member`));
	-- m_id, m_passwd, m_name, m_phone, m_birthday, m_gender, m_addr1, m_addr2, m_addr3, m_question, m_answer,

-- m_email, m_join, m_point, m_total_buy, m_total_order, m_total_login, m_exit				 
SELECT *
  FROM (SELECT m_id, m_name, m_gender, m_point, m_join, m_total_order, m_total_buy
		  FROM (SELECT m_id, m_name, m_gender, m_point, m_join, m_total_order, m_total_buy
				  FROM MEMBER
			   	 WHERE m_name LIKE CONCAT('%','이종','%')	AND m_gender = 0
				 ORDER BY m_total_buy DESC, m_total_order DESC));

SELECT m_id, m_name, m_gender, m_point, m_join, m_total_order, m_total_buy
FROM MEMBER
WHERE m_name LIKE CONCAT('%','이종','%')	AND m_gender = 0
ORDER BY m_total_buy DESC, m_total_order DESC;
			
/*SELECT
	ROWNUM AS recNum,
	m_id,
	m_name,
	m_gender,
	m_point,
	m_join,
	m_total_order,
	m_total_buy
FROM
	(
	SELECT
		m_id,
		m_name,
		m_gender,
		m_point,
		m_join,
		m_total_order,
		m_total_buy
	FROM
		MEMBER;*/

-- ----------------------------------------------------
-- AdminProduct
-- ----------------------------------------------------
select pro_num, pro_category, pro_name, pro_price, pro_content, pro_salesrate, pro_cre_date, pro_status, pro_color, pro_size, pro_quantity, pro_sold, pro_hits, re_replyCount
  from product;
/* 총 제품 수 */
select count(pro_num) from product	;
/* 새로나온 제품 기준 30일 */
select count(pro_num) from product	where DATE_ADD(pro_cre_date, INTERVAL 3 MONTH)>=NOW();
/* 판매량이 많은 제품  */
select count(pro_num) from product	where pro_sold>=10;
/* 세일중인 제품 */
select count(pro_num) from product	where pro_salesrate>0;
/* 후기수 가 많은 제품 */
select count(pro_num) from product	where re_replyCount>=2;
/* 판매 중지된 상품 */
select count(pro_num) from product	where pro_status='품절';


SELECT count(DATE_ADD(pro_cre_date, INTERVAL 30 DAY))
  FROM product;

SELECT a.*
  FROM (SELECT FORMAT(@ROWNUM := @ROWNUM+1, 0) AS rn ,b.*,c.pro_imagefilename
		  FROM product b JOIN pro_img c ON b.pro_num = c.pro_num
		 WHERE (@rownum:=0)=0
		 		AND c.pro_img_state=1
				AND b.pro_category=1
				AND b.pro_status='판매중'
				AND b.pro_name LIKE CONCAT('%','','%')
		 ORDER BY b.pro_price DESC
		    	 ,b.pro_salesrate DESC
		 		 ,b.pro_hits DESC
		 		 ,b.pro_num)a
 WHERE rn between 1 AND 20;

select *
from product p ;
 
select *
  from pro_img ;		 		
 
SELECT @rownum:=@rownum+1 AS rn ,b.*,c.*
		  FROM product b JOIN pro_img c ON b.pro_num = c.pro_num
		 WHERE (@rownum:=0)=0 
		 		AND c.pro_img_state=1
				AND b.pro_category=1
				AND b.pro_status='판매중'
				AND pro_name LIKE CONCAT('%','','%')
		 ORDER BY b.pro_price DESC
		    	 ,b.pro_salesrate DESC
		 		 ,b.pro_hits DESC
		 		 ,b.pro_num;		  
		 		
		
SELECT @rownum:=@rownum+1 AS rn ,b.*,c.*
  FROM product b JOIN pro_img c ON b.pro_num = c.pro_num
 WHERE (@rownum:=0)=0 
 	AND c.pro_img_state=1
 	<IF test="pro_category !=null and !pro_category.equals('')">
			AND b.pro_category=#{pro_category}
	</IF>
	<IF test="pro_status !=null and !pro_status.equals('all') ">
			AND b.pro_status=#{pro_status}
	</IF>
	<IF test="keyword !=null and !keyword.equals('')">
			AND pro_name LIKE CONCAT('%','','%')
	</IF>
	ORDER BY
	<if test="order_price !=null and !order_price.equals('')">
			<choose>
				<when test="order_price.equals('price_desc')">
					b.pro_price DESC ,
				</when>
				<when test="order_price.equals('price_asc')">
					b.pro_price ASC ,
				</when>
			</choose>
		</if>
		<if test="order_salesRate !=null and !order_salesRate.equals('')">
			<choose>
				<when test="order_salesRate.equals('salesRate_desc')">
					b.pro_salesrate DESC ,
				</when>
				<when test="order_salesRate.equals('salesRate_asc')">
					b.pro_salesrate ASC ,
				</when>
			</choose>
		</if>
		<if test="order_count !=null and !order_count.equals('')">
			<choose>
				<when test="order_hits.equals('hits_desc')">
					b.pro_hits DESC ,
				</when>
				<when test="order_hits.equals('hits_asc')">
					b.pro_hits ASC ,
				</when>
			</choose>
		</if>
			b.pro_code
		) a WHERE rn between (#{section,jdbcType=NUMERIC}-1)*200+(#{pageNum,jdbcType=NUMERIC}-1)*20+1
		and
		(#{section,jdbcType=NUMERIC}-1)*200+#{pageNum,jdbcType=NUMERIC}*20
;



SELECT a.* FROM (SELECT FORMAT(@ROWNUM := @ROWNUM+1, 0) AS rn ,b.*,c.pro_imagefilename FROM ( SELECT @ROWNUM :=0 ) R, product b JOIN pro_img c ON b.pro_num = c.pro_num WHERE c.pro_img_state=1 ORDER BY b.pro_num)a WHERE rn BETWEEN (1-1)*200+(4-1)*20+1 AND (1-1)*200+4*20;


-- 제품 추가
SELECT pro_num.nextval FROM DUAL;
SELECT * FROM product WHERE pro_num =1013;

SELECT * FROM pro_img  WHERE pro_num =1013;
SELECT * FROM `order`;

INSERT INTO proj21_shop.product
	(pro_num, pro_category, pro_name, pro_price, pro_content, pro_salesrate, pro_color, pro_size, pro_quantity)
VALUES
	(1119, 1, 'blackT', 5000, '검정색 반팔티 TEST사이즈 입니다.'  , 10 , 11, 9, 10);

insert into product 
					   (pro_num, pro_category, pro_name, pro_price, pro_content, pro_salesrate, pro_status
					   , pro_color, pro_size, pro_quantity)
				values
					  (1999, 1, 'TestT', 5000, 'TEST색 반팔티 TEST사이즈 입니다.', 10, '세일', 99, 9, 10);
					 
DELETE FROM product WHERE pro_num=1999;

DELETE FROM product WHERE pro_num=2999;
SELECT LAST_INSERT_ID();
SELECT *from (select max(seq)+1 from tbl_board) NEXT;
SELECT * FROM pro_img WHERE pro_num=2999;

INSERT INTO pro_img
		(pro_num, pro_imagefilename, pro_img_state)
values
		(1999, '1999.jpg', 1),
		(1999, '1999-1.jpg', 0),
		(1999, '1999-2.jpg', 0);
insert 
  into product (pro_num, pro_category, pro_name, pro_price, pro_content
					, pro_salesrate, pro_status , pro_color, pro_size, pro_quantity)
values (1, 1, 1, 1, 1, 1, 1 , 1, 1, 1);
DELETE FROM pro_img 
WHERE pro_num=1999;
DELETE FROM pro_img 
WHERE pro_num<3000;
DELETE FROM pro_img 
WHERE pro_num=1*;
DELETE FROM product WHERE pro_num<3000;

SELECT * FROM product p ;

UPDATE product
   SET pro_quantity = pro_quantity+5
 WHERE pro_num=1031;

-- 제품 지우기 전에 제품 사진들 지우기
delimiter $$
create trigger delete_pro_img
before delete on product
for each row
begin
delete from pro_img
where pro_num = old.pro_num;
end $$
delimiter ;

select count(pro_num)
  from product
 where pro_category = 1;
 
SELECT *
 FROM `order` o ;
SELECT *
 FROM product p2 ;

-- 주문 SQL===============================

SELECT	a.*, c.pro_imagefilename ,	p.pro_name
  FROM (SELECT FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS rn,	order_code,	order_date,	order_pro_quantity,	p.pro_price-(p.pro_salesrate*0.01*p.pro_price) AS order_price,
  			   delivery_status, order_member_name,	request_to_delivery, which_bank, order_pro_num,	p.pro_num,
        	   p.pro_color, p.pro_size
		  FROM ( SELECT @ROWNUM := 0 ) R, `ORDER` o JOIN product p ON o.pro_num = p.pro_num
		 WHERE  o.order_pro_num >= 1
				AND o.delivery_status = '배송준비중'
				AND o.order_member_name LIKE CONCAT('%', '이종', '%')
		) a , product p JOIN pro_img c ON p.pro_num = c.pro_num
 WHERE c.pro_img_state = 1
 		AND p.pro_num = a.pro_num
		AND rn
		BETWEEN 1
 		AND 10
 ORDER BY a.order_price DESC;
 
INSERT INTO proj21_shop.`order`
(order_member_id, pro_num, order_pro_num, order_member_name, order_pro_quantity, order_price, order_discount,
 receiver_name, receiver_tel1, receiver_tel2, delivery_addr1, delivery_addr2, delivery_addr3, request_to_delivery, who_pay, which_bank)
values
('test01', 6163, 1,'이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test01', 1033, 1,'이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민');

SELECT *
FROM `ORDER`;

SELECT DISTINCT 
	a.*,
	c.pro_imagefilename ,
	p.pro_name
FROM
	(
	SELECT 
		FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS rn,
		order_code,
		order_pro_num,
		order_date,
		order_pro_quantity,
		delivery_status,
		order_member_name,
		request_to_delivery,
		which_bank,
		order_price,
		p.pro_price-(p.pro_salesrate*0.01*p.pro_price) AS order_value,
		p.pro_num,
		p.pro_color,
		p.pro_size
	FROM
		(SELECT@ROWNUM := 0 ) R, `ORDER` o JOIN product p ON o.pro_num = p.pro_num
	WHERE
		order_date > 0 )a,	product p JOIN pro_img c ON p.pro_num = c.pro_num
WHERE
	c.pro_img_state = 1
	AND p.pro_num = a.pro_num
	AND rn BETWEEN (1-1)* 100 +(1-1)* 10 + 1 AND (1-1)* 100 +1* 10;

select count(distinct order_pro_num)
  from `order` 
 where order_member_id > 0;

SELECT *
  FROM `order`;
  
 UPDATE `order`
    SET delivery_status = '배송준비중'
  WHERE order_pro_num = '1';
 
 select count(delivery_status)
 from `order`
 where order_member_id= 'test01' and delivery_status = '배송준비중';
  
 select if(count(order_code)=0,'false','true') 
   from `order`
  where order_member_id ='test01' and delivery_status='배송준비중';
  
 
SELECT a.*
  FROM (SELECT order_pro_num, order_code , order_date , order_pro_quantity , order_price ,
  			   delivery_status ,order_member_name, request_to_delivery, which_bank,
			   p.pro_num, p.pro_color, p.pro_size, p.pro_name, img.pro_imagefilename
		  FROM `order` o , product p , pro_img img
		 WHERE o.pro_num = p.pro_num AND img.pro_img_state = 1 AND img.pro_num = p.pro_num AND o.order_member_id = #{memberId}
			   <choose>
			   <when test="orderProNum != null">
			   AND
			   o.order_pro_num = #{orderProNum}
			   </when>
			   <otherwise></otherwise>
			   </choose>
			   <if test="deliveryStatus !=null">
			   AND
			   o.delivery_status= #{deliveryStatus}
			   </if>
		) a, product p
  WHERE p.pro_num = a.pro_num
  ORDER BY a.order_code DESC;
  
SELECT a.* 
  FROM (SELECT order_pro_num, order_code , order_date , order_pro_quantity , order_price ,
  			   delivery_status ,order_member_name, request_to_delivery, which_bank,
			   p.pro_num, p.pro_color, p.pro_size, p.pro_name, img.pro_imagefilename
		  FROM `order` o , product p , pro_img img
		 WHERE o.pro_num = p.pro_num AND img.pro_img_state = 1 AND img.pro_num = p.pro_num AND o.order_member_id = 'test01'
		)a, product p
  WHERE p.pro_num = a.pro_num
  ORDER BY a.order_code DESC;
  
SELECT *
FROM pro_img pi2 ;

SELECT SUM(order_price)/COUNT(order_code)
  FROM `order`
 WHERE order_member_id = 'test01';
 
select if(count(cart_pro_num)=0,'false','true')
			  from cart
			 where cart_member_Id='test01';
			 
DELETE
FROM `order`
 where order_code=1;
 
 SELECT *
 from `order`;

 SELECT *
 from MEMBER ;

SELECT count(order_pro_num) FROM (SELECT * FROM MEMBER m JOIN `order` o ON m.m_id =o.order_member_id WHERE m_id = 'admin' GROUP BY order_pro_num)AS a;

DELETE
FROM member 
 where m_id='test051';

SELECT
	m_id,
	m_name,
	m_point,
	m_total_login,
	m_total_buy,
	m_total_order
FROM
	(SELECT	@rownum := @rownum + 1 AS rn,m_id,m_name,m_point,m_total_login,m_total_buy,m_total_order
	   FROM (SELECT @ROWNUM := 0 ) R, `MEMBER`
	  WHERE	m_name LIKE CONCAT('%','','%'))
WHERE
	rn = 1;

SELECT
	m_id,
	m_code,
	m_name,
	m_point,
	m_total_login,
	m_total_buy,
	m_total_order
FROM
	(
	SELECT
		@rownum := @rownum + 1 AS rn,
		m_id,
		m_name,
		m_point,
		m_total_login,
		m_total_buy,
		m_total_order
	FROM
		MEMBER
	WHERE
		m_name LIKE CONCAT('%',1, '%')
		OR m_id LIKE CONCAT('%',1, '%')
		AND (@rownum := 0)= 0)
WHERE
	rn = 1;

SELECT
	m_id,
	m_name,
	m_point,
	m_total_login,
	m_total_buy,
	m_total_order
FROM
	
WHERE
	rn = 1;

SELECT m_id, m_name, m_point, m_total_login, m_total_buy, m_total_order
  FROM (SELECT (@rownum := @rownum + 1) AS rn, m_id, m_name, m_point,
  		m_total_login, m_total_buy, m_total_order
  		  FROM `MEMBER`
  		 WHERE m_name LIKE CONCAT('%', 'test', '%') OR m_id LIKE CONCAT('%', 'test', '%') AND (@rownum:=0)=0) AS A
 WHERE rn=1;
 
SELECT
	cart_num,
	c.cart_member_id,
	c.cart_pro_num,
	cart_pro_quantity,
	p.pro_imagefilename,
	p.pro_name,
	p.pro_price,
	p.pro_size,
	p.pro_salesrate
FROM
	cart c
JOIN productall p ON
	c.cart_pro_num = p.pro_num
WHERE
	cart_member_Id ='test01';
	
SELECT *
FROM cart;

SELECT DISTINCT a.*
		  FROM (SELECT order_pro_num, order_code , order_date , order_pro_quantity , order_price ,
		  			   delivery_status ,order_member_name, request_to_delivery, which_bank,
					   p.pro_num, p.pro_color, p.pro_size, p.pro_name, img.pro_imagefilename
				  FROM `order` o , product p , pro_img img
				 WHERE o.pro_num = p.pro_num AND img.pro_img_state = 1 AND img.pro_num = p.pro_num AND o.order_member_id = 'test01'
					   AND
					   o.delivery_status= '배송준비중'
				) a, product p
		  WHERE p.pro_num = a.pro_num
		  ORDER BY a.order_code DESC;
		  
SELECT DISTINCT order_pro_num, order_code , order_date , order_pro_quantity , order_price ,
		  			   delivery_status ,order_member_name, request_to_delivery, which_bank,
					   p.pro_num, p.pro_color, p.pro_size, p.pro_name, img.pro_imagefilename
  FROM `order` o , product p , pro_img img
 WHERE o.pro_num = p.pro_num AND img.pro_img_state = 1 AND img.pro_num = p.pro_num AND o.order_member_id = 'test01'AND o.delivery_status= '배송준비중'
 ORDER BY order_code;
 

SELECT * FROM `ORDER`;
UPDATE `order`      SET delivery_status = '배송준비중'     WHERE order_pro_num = 1 AND order_code =1;


SELECT
	a.*
FROM
	(
SELECT
		FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS rn,
		re_member,
		r.pro_num,
		re_image,
		re_image2,
		re_content,
		re_stars,
		re_date,
		p.pro_name,
		p.pro_imagefilename,
		p.pro_color,
		p.pro_size
	FROM
		review r JOIN productall p ON r.pro_num = p.pro_num
	WHERE 
		(@rownum:=0)=0
		AND re_member LIKE CONCAT('%', 'test01', '%')
	) AS a
WHERE
	rn BETWEEN (1-1)* 100 +(1-1)* 10 + 1 AND (1-1)* 100 + 1 * 10
ORDER BY
	re_date DESC;

		
		
SELECT *
  FROM review;
SELECT *
  FROM productall;
		
		

	SELECT
		FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS rn,
		re_member,
		r.pro_num,
		re_image,
		re_image2,
		re_content,
		re_stars,
		re_date,
		p.pro_name,
		p.pro_imagefilename,
		p.pro_color,
		p.pro_size
	FROM
		review r JOIN productall p ON r.pro_num = p.pro_num
	WHERE 
		(@rownum:=0)=0
		AND re_member LIKE CONCAT('%', 'test01', '%');
			
		
		
		
		
		
SELECT
	a.*
FROM
	(
	SELECT
		FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS rn,
		re_member,
		re_num,
		r.pro_num,
		re_image,
		re_image2,
		re_content,
		re_stars,
		re_date,
		p.pro_name,
		p.pro_imagefilename,
		p.pro_color,
		p.pro_category,
		p.pro_size
	FROM
		(
		SELECT
			@ROWNUM := 0 ) R,
		review r
	JOIN productall p ON
		r.pro_num = p.pro_num
	WHERE
		re_date > 0
		AND re_member LIKE CONCAT('%', 'test01', '%') ) AS a
WHERE
	rn BETWEEN (1-1)* 100 +(1-1)* 10 + 1 AND (1-1)* 100 +1* 10
ORDER BY
	re_date DESC;

SELECT count(re_num)
		  FROM review
		 WHERE re_num > 0
			AND re_member LIKE CONCAT('%', 'test01', '%');
		
		
		
		
		
		
		
		
		
		
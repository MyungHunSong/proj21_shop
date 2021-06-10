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
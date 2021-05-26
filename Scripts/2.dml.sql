-- 회원
INSERT INTO proj21_shop.`member`
				(m_id
				, m_passwd
				, m_name
				, m_phone
				, m_birthday
				, m_gender
				, m_question_num
				, m_answer
				, m_email
				, m_join
				, m_point
				, m_total_buy
				, m_total_order
				, m_total_login
				, m_exit
				, m_addr
				, m_addr_de)
VALUES(
				'test01'
				, password(123)
				, '이종윤'
				, '010-1234-5678'
				, '1994-08-17'
				, 1
				, 1
				, 'test'
				, 'test@test.co.kr'
				, '20200101'
				, 2000
				, 0
				, 0
				, 1
				, 0
				, '대구광역시 남구 봉덕동 이천로 51'
				, '2층');
-- 주소
INSERT INTO proj21_shop.address
			(m_id, m_addr, m_addr_de)
values
			('test01', '대구광역시 남구 봉덕동 이천로 51', '2층');

-- 관리자
INSERT INTO admin
(ad_id, ad_pass)
VALUES('manager', password(123));

-- 제품
INSERT INTO proj21_shop.product
(
				pro_code
				, pro_category
				, pro_name
				, pro_price
				, pro_salesrate
				, pro_cre_date
				, pro_status
				, pro_color
				, pro_size
				, pro_quantity
				, pro_sold
				, pro_hits
)
VALUES(
				'1111'
				, 1
				, '반팔'
				, 5000
				, 0
				, '20200927'
				, '판매중'
				, 1
				, 0
				, 0
				, 0
				, 0);

-- 제품 이미지
INSERT INTO proj21_shop.pro_img
(pro_num, pro_imagefilename, pro_img_state)
VALUES(1, '1111-1.jpg', 0);

-- 장바구니
INSERT INTO proj21_shop.cart
(cart_m_Id, cart_pro_num, cart_pro_quantity)
<<<<<<< HEAD
VALUES('test01', 1, 1);
=======
VALUES('test01', 1, 0);
>>>>>>> refs/heads/dml_및_sql_LTH

-- 주문 
INSERT INTO proj21_shop.`order`
(
order_member_id
, or_num
, pro_num
, order_member_name
, order_pro_quantity
, order_price
, order_discount
, receiver_name
, receiver_tel1
, receiver_tel2
, delivery_addr
, delivery_addr_de
, delivery_status
, request_to_delivery
<<<<<<< HEAD
, order_date
, who_pay
=======
, order_date, who_pay
>>>>>>> refs/heads/dml_및_sql_LTH
, which_bank
, acount_num
)
VALUES(
'test01'
, 1
, 1
, '이종윤'
, 2
, 10000
, 0
, '이종윤'
, '010-1234-5678'
, '010-1234-5678'
<<<<<<< HEAD
, '대구광역시 남구 봉덕동 이천로 51' 
, '2층'
,'배송완료'
, '문앞' 
, now()
, '이종윤'
, '국민'
, 5000
);
=======
, '판매중'
, '문앞'
, '2020-09-27'
, '이종윤'
, '국민'
, '111111111');
>>>>>>> refs/heads/dml_및_sql_LTH

-- Q&A
INSERT INTO qna
(q_pro_num, q_title, q_option, q_member, q_content, q_file, q_date, q_hits, q_group, q_indent, q_step)
VALUES(1, 'test', 'test', 'test1', 'test', 'test', '2020-09-27', 0, 0, 0, 0);

-- 후기
INSERT INTO review
(pro_num, re_member, re_content, re_image, re_image2, re_date, re_stars)
VALUES(1, 'test1', 'test', 'test.img', 'test2.img', '2020-09-27', 0);

-- 후기 댓글 
INSERT INTO proj21_shop.re_reply
(re_rep_num, re_rep_member, re_rep_date)
VALUES(1, 'test1', '2020-09-27');

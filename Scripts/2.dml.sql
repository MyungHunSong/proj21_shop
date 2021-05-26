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
select * from member;
desc `member` ;
-- 주소
INSERT INTO proj21_shop.address
(m_id, m_addr, m_addr_de)
VALUES('', '', '');

-- 관리자
INSERT INTO proj21_shop.admin
(ad_id, ad_pass)
VALUES('', '');

-- 제품
INSERT INTO proj21_shop.product
(pro_code, pro_category, pro_name, pro_price, pro_salesrate, pro_cre_date, pro_status, pro_color, pro_size, pro_quantity, pro_sold, pro_hits)
VALUES('', 0, '', 0, 0, '', '', 0, 0, 0, 0, 0);

-- 제품 이미지
INSERT INTO proj21_shop.pro_img
(pro_num, pro_imagefilename, pro_img_state)
VALUES(0, '', 0);

-- 장바구니
INSERT INTO proj21_shop.cart
(cart_m_Id, cart_pro_num, cart_pro_quantity)
VALUES('', 0, 0);

-- 주문 
INSERT INTO proj21_shop.`order`
(order_member_id, or_num, pro_num, order_member_name, order_pro_quantity, order_price, order_discount, receiver_name, receiver_tel1, receiver_tel2, delivery_addr, delivery_addr_de, delivery_status, request_to_delivery, order_date, who_pay, which_bank, acount_num)
VALUES('', 0, 0, '', 0, 0, 0, '', 0, 0, '', '', '', '', '', '', '', 0);

-- Q&A
INSERT INTO proj21_shop.qna
(q_title, q_option, q_member, q_content, q_file, q_date, q_hits, q_group, q_indent, q_step)
VALUES('', '', '', '', '', '', 0, 0, 0, 0);

-- 후기
INSERT INTO proj21_shop.review
(pro_num, re_member, re_content, re_image, re_image2, re_date, re_stars)
VALUES(0, '', '', '', '', '', 0);

-- 후기 댓글 
INSERT INTO proj21_shop.re_reply
(re_rep_num, re_rep_member, re_rep_date)
VALUES(0, '', '');

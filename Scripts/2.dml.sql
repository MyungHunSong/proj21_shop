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
-- 회원
INSERT INTO proj21_shop.`member`
(m_id , m_passwd , m_name, m_phone, m_birthday, m_gender, m_addr1, m_addr2, m_addr3, m_question, m_answer, m_email)
VALUES
('test01', password(123), '이종가', '010-1234-5678', '1994-08-17', 1, 746858, '대구광역시 남구 봉덕동 이천로 51', '3층', '본인확인질문', '본인확인질문답변', 'test1@test.co.kr'),
('test02', password(123), '이종나', '010-1234-5678', '1994-08-17', 1, 746851, '대구광역시 남구 봉덕동 이천로 52', '2층','본인확인질문', '본인확인질문답변', 'test2@test.co.kr'),
('test03', password(123), '이종다', '010-1234-5678', '1994-08-17', 1, 746852, '대구광역시 남구 봉덕동 이천로 53', '1층','본인확인질문', '본인확인질문답변', 'test3@test.co.kr'),
('test04', password(123), '이종라', '010-1234-5678', '1994-08-17', 0, 746853, '대구광역시 남구 봉덕동 이천로 54', '2층','본인확인질문', '본인확인질문답변', 'test4@test.co.kr'),
('test05', password(123), '이종마', '010-1234-5678', '1994-08-17', 0, 746854, '대구광역시 남구 봉덕동 이천로 55', '3층','본인확인질문', '본인확인질문답변', 'test5@test.co.kr');

select *
  from member;
-- 주소
INSERT INTO proj21_shop.address
			(m_id, m_addr1, m_addr2, m_addr3)
values
			('test01', 746858, '대구광역시 남구 봉덕동 이천로 51', '3층'),
			('test02', 746851, '대구광역시 남구 봉덕동 이천로 52', '2층'),
			('test03', 746852, '대구광역시 남구 봉덕동 이천로 53', '1층'),
			('test04', 746853, '대구광역시 남구 봉덕동 이천로 54', '2층'),
			('test05', 746854, '대구광역시 남구 봉덕동 이천로 55', '3층');
select *
  from Address;
-- 관리자
INSERT INTO admin
	(ad_id, ad_pass)
values
	('admin', password(123));
select *
  from admin;
 
 
 
-- 제품
-- 제품 번호 1      옷 카테고리 = (1:반팔)(2:긴팔)(3:슬립리스)(4:후디)(5:셔츠)(6:맨투맨)
-- 			01      옷 색상       = 아래 참고 색상=번호 참고
-- 			  1    옷 사이즈    = (1:XS)(2:S)(3:M)(4:L)(5:XL)

-- white = 1, ivory = 2, gray = 3, pink = 4, yellow =5, mint = 6
-- green = 7, purple = 8, navy = 9, black = 11, brown = 12, orange = 13, blue = 14, red=15, basic=16

INSERT INTO proj21_shop.product
	(pro_num, pro_category, pro_name, pro_price, pro_content, pro_salesrate, pro_color, pro_size, pro_quantity)
VALUES
	(1111, 1, 'blackT',    5000, '검정색 반팔티 M사이즈 입니다.'  , 10 , 11, 3, 10),
	(1031, 1, 'grayT',     5000, '회색 반팔티 M사이즈 입니다.'    , 10 , 3, 3, 10),
	(1091, 1, 'navyT',     5000, '네이비 반팔티 M사이즈 입니다.'  , 10 , 9, 3, 10),
	(1141, 1, 'blueT',     5000, '파란 반팔티 M사이즈 입니다.'    , 10 , 14, 3, 10),
	(1041, 1, 'pinkT',     5000, '분홍 반팔티 M사이즈 입니다.'    , 10 ,  4, 3, 10),
	(2091, 2, 'navyLong',    5000, 'navy 긴팔티 M사이즈 입니다.'     , 10 , 9, 3, 10),
	(2061, 2, 'mintLong',    5000, 'mint 긴팔티 M사이즈 입니다.'     , 10 , 6, 3, 10),
	(2121, 2, 'brownLong',   5000, 'brown 긴팔티 M사이즈 입니다.'    , 10 , 12, 3, 10),
	(2111, 2, 'blackLong',   5000, 'black 긴팔티 M사이즈 입니다.'    , 10 , 11, 3, 10),
	(2021, 2, 'ivoryLong',   5000, 'ivory 긴팔티 M사이즈 입니다.'    , 10 , 2, 3, 10),
	(3151, 3, 'redSleev',   5000, 'redSleev M사이즈 입니다.'   ,5 , 15, 3, 10),
	(3121, 3, 'brownSleev', 5000, 'brownSleev M사이즈 입니다.' ,5 , 12, 3, 10),
	(3111, 3, 'blackSleev', 5000, 'blackSleev M사이즈 입니다.' ,5 , 11, 3, 10),
	(3141, 3, 'blueSleev',  5000, 'blueSleev M사이즈 입니다.'  ,5 , 14, 3, 10),
	(3021, 3, 'ivorySleev', 5000, 'ivorySleev M사이즈 입니다.' ,5 ,  2, 3, 10),
	(4041, 4, 'AUTHENTIC PINK',     		 5000, 'PINK 후디 M사이즈 입니다.'    , 5  ,  4, 3, 10),
	(4071, 4, 'ARCH HOODIE GREEN',  		 5000, 'GREEN 후디 M사이즈 입니다.'    , 5  ,  7, 3, 10),
	(4091, 4, 'Bear Hoodie Navy',   		 5000, 'Navy 후디 M사이즈 입니다.'    , 5  ,  9, 3, 10),
	(4031, 4, 'Crop Hoodie Gray',   		 5000, 'Gray 후디 M사이즈 입니다.'    , 5  ,  3, 3, 10),
	(4111, 4, 'SOFT HOODIE Black',    		 5000, 'Black 후디 M사이즈 입니다.'    , 5  , 11, 3, 10),
	(5031, 5, 'LOLA SHIRT gray',    	 5000, 'gray 셔츠 M사이즈 입니다.'       , 10 , 3, 3, 10),
	(5021, 5, 'FRIDAY SHIRT (IVORY)',    5000, 'IVORY 셔츠 M사이즈 입니다.'      , 10 , 2, 3, 10),
	(5011, 5, 'NECK SHIRT white',    	 5000, 'white 셔츠 M사이즈 입니다.'      , 10 , 1, 3, 10),
	(5051, 5, '풀오버 셔츠 옐로우',    	 	 5000, '옐로우 셔츠 M사이즈 입니다.'       , 10 , 5, 3, 10),
	(5111, 5, '오버핏 체크셔츠 black',    	 5000, 'black 셔츠 M사이즈 입니다.'         , 10 , 11, 3, 10),
	(5081, 5, 'CHECK SHIRTS_PURPLE',     5000, 'PURPLE 셔츠 M사이즈 입니다.'      , 10 , 8, 3, 10),
	(6011, 6, '크롭 맨투맨 - 화이트',			    	5000, '화이트 맨투맨 M사이즈 입니다.', 0  ,  1, 3, 10),
	(6091, 6, 'CREWNECK KS [NAVY]', 		 		5000, 'NAVY 맨투맨 M사이즈 입니다.', 0  ,  9, 3, 10),
	(6031, 6, 'balloon type (GRAY)',				5000, 'GRAY 맨투맨  M사이즈 입니다.', 0  ,  3, 3, 10),
	(6021, 6, '코지 _IVORY 스웨트셔츠',					5000, 'IVORY 맨투맨 M사이즈 입니다.', 0  ,  2, 3, 10),
	(6161, 6, '테일러스튜디오(basic) FG 맨투맨',			5000, 'basic 맨투맨 M사이즈 입니다.', 0  , 16, 3, 10);
-- white = 1, ivory = 2, gray = 3, pink = 4, yellow =5, mint = 6
-- green = 7, purple = 8, navy = 9, black = 11, brown = 12, orange = 13, blue = 14, red=15, basic = 16
select *
  from product;
delete
  from product
 where pro_category <=8000;

-- 제품 이미지
desc pro_img ;
-- pro_img_state가 1이면 메인 이미지 0이면 보조 이미지
INSERT INTO proj21_shop.pro_img
		(pro_num, pro_imagefilename, pro_img_state)
values
		(1111, '1111-1.jpg', 1),
		(1031, '1031-1.jpg', 1),
		(1091, '1091-1.jpg', 1),
		(1141, '1141-1.jpg', 1),
		(1041, '1041-1.jpg', 1),
		(2091, '2091-1.jpg', 1),
		(2061, '2061-1.jpg', 1),
		(2121, '2121-1.jpg', 1),
		(2111, '2111-1.jpg', 1),
		(2021, '2021-1.jpg', 1),
		(3151, '3151-1.jpg', 1),
		(3121, '3121-1.jpg', 1),
		(3111, '3111-1.jpg', 1),
		(3141, '3141-1.jpg', 1),
		(3021, '3021-1.jpg', 1),
		(4041, '4041-1.jpg', 1),
		(4071, '4071-1.jpg', 1),
		(4091, '4091-1.jpg', 1),
		(4031, '4031-1.jpg', 1),
		(4111, '4111-1.jpg', 1),
		(5031, '5031-1.jpg', 1),
		(5021, '5021-1.jpg', 1),
		(5011, '5011-1.jpg', 1),
		(5051, '5051-1.jpg', 1),
		(5111, '5111-1.jpg', 1),
		(5081, '5081-1.jpg', 1),
		(6011, '6011-1.jpg', 1),
		(6091, '6091-1.jpg', 1),
		(6031, '6031-1.jpg', 1),
		(6021, '6021-1.jpg', 1),
		(6161, '6161-1.jpg', 1);
	
select *
  from pro_img;
-- 여기 까지

-- 장바구니
INSERT INTO proj21_shop.cart
		(cart_member_Id, cart_pro_num, cart_pro_quantity)
values
		('test01', 6161, 1);
select *
  from cart;
-- 주문 
INSERT INTO proj21_shop.`order`
(order_member_id, order_num, pro_num, order_member_name, order_pro_quantity, order_price, order_discount, receiver_name
, receiver_tel1, receiver_tel2, delivery_addr1, delivery_addr2, delivery_addr3, request_to_delivery, who_pay, which_bank)
values
('test01', 210530, 6161, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test02', 210530, 5081, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test02', 210530, 5011, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test03', 210531, 6161, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test03', 210531, 6161, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test03', 210531, 4071, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test04', 210531, 4091, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test04', 210532, 4031, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test05', 210532, 4111, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test05', 210532, 5031, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test05', 210532, 5021, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민');
select *
  from `order`;

-- Q&A
INSERT INTO qna
(q_title, q_option, q_member, q_content, q_file)
values
('아니이게뭐죠?', '제품상담', 'test01', '이런 제품이 있나요? 말이 됩니까? 어떻게 하실껀가요?', '첨부파일'),
('반품관련공지', '공지', 'admin', '배송이 출발하면 반품이 안됩니다.', '첨부파일');
select *
  from qna;
-- 후기
INSERT INTO review
(pro_num, re_member, re_content, re_image, re_image2, re_stars)
values
(6161, 'test01', '완전 싸고 좋습니다. 강추드립니다.', 'review_test.jpg', 'review_test.jpg', 5);
select *
  from review;
-- 후기 댓글 
INSERT INTO proj21_shop.re_reply
(re_num, re_rep_member,re_rep_content)
values
(1, 'test01','후기 감사합니다.');

-- 회원
INSERT INTO proj21_shop.`member`
(m_id , m_passwd , m_name, m_phone, m_birthday, m_gender, m_addr1, m_addr2, m_addr3, m_question, m_answer, m_email)
VALUES
('test01', password(123), '이종가', '010-1234-5678', '1994-08-17', 1, 746858, '대구광역시 남구 봉덕동 이천로 51', '3층', '본인확인질문', '본인확인질문답변', 'test1@test.co.kr'),
('test02', password(123), '이종나', '010-1234-5678', '1994-08-17', 1, 746851, '대구광역시 남구 봉덕동 이천로 52', '2층','본인확인질문', '본인확인질문답변', 'test2@test.co.kr'),
('test03', password(123), '이종다', '010-1234-5678', '1994-08-17', 1, 746852, '대구광역시 남구 봉덕동 이천로 53', '1층','본인확인질문', '본인확인질문답변', 'test3@test.co.kr'),
('test04', password(123), '이종라', '010-1234-5678', '1994-08-17', 0, 746853, '대구광역시 남구 봉덕동 이천로 54', '2층','본인확인질문', '본인확인질문답변', 'test4@test.co.kr'),
('test05', password(123), '이종마', '010-1234-5678', '1994-08-17', 0, 746854, '대구광역시 남구 봉덕동 이천로 55', '3층','본인확인질문', '본인확인질문답변', 'test5@test.co.kr');

-- 주소
INSERT INTO proj21_shop.address
			(m_id, m_addr1, m_addr2, m_addr3)
values
			('test01', 746858, '대구광역시 남구 봉덕동 이천로 51', '3층'),
			('test02', 746851, '대구광역시 남구 봉덕동 이천로 52', '2층'),
			('test03', 746852, '대구광역시 남구 봉덕동 이천로 53', '1층'),
			('test04', 746853, '대구광역시 남구 봉덕동 이천로 54', '2층'),
			('test05', 746854, '대구광역시 남구 봉덕동 이천로 55', '3층');
-- 관리자
INSERT INTO admin
	(ad_id, ad_pass)
values
	('admin', password(123));
 
 
-- 제품
-- 제품 번호 1      옷 카테고리 = (1:반팔)(2:긴팔)(3:슬립리스)(4:후디)(5:셔츠)(6:맨투맨)
-- 			01      옷 색상       = 아래 참고 색상=번호 참고
-- 			  1    옷 사이즈    = (1:XS)(2:S)(3:M)(4:L)(5:XL)

-- white = 1, ivory = 2, gray = 3, pink = 4, yellow =5, mint = 6
-- green = 7, purple = 8, navy = 9, black = 11, brown = 12, orange = 13, blue = 14, red=15, basic=16

INSERT INTO proj21_shop.product
	(pro_num, pro_category, pro_name, pro_price, pro_content, pro_salesrate, pro_color, pro_size, pro_quantity)
VALUES
	(1113, 1, 'blackT',    5000, '검정색 반팔티 M사이즈 입니다.'  , 10 , 11, 3, 10),
	(1033, 1, 'grayT',     5000, '회색 반팔티 M사이즈 입니다.'    , 10 , 3, 3, 10),
	(1093, 1, 'navyT',     5000, '네이비 반팔티 M사이즈 입니다.'  , 10 , 9, 3, 10),
	(1143, 1, 'blueT',     5000, '파란 반팔티 M사이즈 입니다.'    , 10 , 14, 3, 10),
	(1043, 1, 'pinkT',     5000, '분홍 반팔티 M사이즈 입니다.'    , 10 ,  4, 3, 10),
	(2093, 2, 'navyLong',    5000, 'navy 긴팔티 M사이즈 입니다.'     , 10 , 9, 3, 10),
	(2063, 2, 'mintLong',    5000, 'mint 긴팔티 M사이즈 입니다.'     , 10 , 6, 3, 10),
	(2123, 2, 'brownLong',   5000, 'brown 긴팔티 M사이즈 입니다.'    , 10 , 12, 3, 10),
	(2113, 2, 'blackLong',   5000, 'black 긴팔티 M사이즈 입니다.'    , 10 , 11, 3, 10),
	(2023, 2, 'ivoryLong',   5000, 'ivory 긴팔티 M사이즈 입니다.'    , 10 , 2, 3, 10),
	(3153, 3, 'redSleev',   5000, 'redSleev M사이즈 입니다.'   ,5 , 15, 3, 10),
	(3123, 3, 'brownSleev', 5000, 'brownSleev M사이즈 입니다.' ,5 , 12, 3, 10),
	(3113, 3, 'blackSleev', 5000, 'blackSleev M사이즈 입니다.' ,5 , 11, 3, 10),
	(3143, 3, 'blueSleev',  5000, 'blueSleev M사이즈 입니다.'  ,5 , 14, 3, 10),
	(3023, 3, 'ivorySleev', 5000, 'ivorySleev M사이즈 입니다.' ,5 ,  2, 3, 10),
	(4043, 4, 'AUTHENTIC PINK',     		 5000, 'PINK 후디 M사이즈 입니다.'    , 5  ,  4, 3, 10),
	(4073, 4, 'ARCH HOODIE GREEN',  		 5000, 'GREEN 후디 M사이즈 입니다.'    , 5  ,  7, 3, 10),
	(4093, 4, 'Bear Hoodie Navy',   		 5000, 'Navy 후디 M사이즈 입니다.'    , 5  ,  9, 3, 10),
	(4033, 4, 'Crop Hoodie Gray',   		 5000, 'Gray 후디 M사이즈 입니다.'    , 5  ,  3, 3, 10),
	(4113, 4, 'SOFT HOODIE Black',    		 5000, 'Black 후디 M사이즈 입니다.'    , 5  , 11, 3, 10),
	(5033, 5, 'LOLA SHIRT gray',    	 5000, 'gray 셔츠 M사이즈 입니다.'       , 10 , 3, 3, 10),
	(5023, 5, 'FRIDAY SHIRT (IVORY)',    5000, 'IVORY 셔츠 M사이즈 입니다.'      , 10 , 2, 3, 10),
	(5013, 5, 'NECK SHIRT white',    	 5000, 'white 셔츠 M사이즈 입니다.'      , 10 , 1, 3, 10),
	(5053, 5, '풀오버 셔츠 옐로우',    	 	 5000, '옐로우 셔츠 M사이즈 입니다.'       , 10 , 5, 3, 10),
	(5113, 5, '오버핏 체크셔츠 black',    	 5000, 'black 셔츠 M사이즈 입니다.'         , 10 , 11, 3, 10),
	(5083, 5, 'CHECK SHIRTS_PURPLE',     5000, 'PURPLE 셔츠 M사이즈 입니다.'      , 10 , 8, 3, 10),
	(6013, 6, '크롭 맨투맨 - 화이트',			    	5000, '화이트 맨투맨 M사이즈 입니다.', 0  ,  1, 3, 10),
	(6093, 6, 'CREWNECK KS [NAVY]', 		 		5000, 'NAVY 맨투맨 M사이즈 입니다.', 0  ,  9, 3, 10),
	(6033, 6, 'balloon type (GRAY)',				5000, 'GRAY 맨투맨  M사이즈 입니다.', 0  ,  3, 3, 10),
	(6023, 6, '코지 _IVORY 스웨트셔츠',					5000, 'IVORY 맨투맨 M사이즈 입니다.', 0  ,  2, 3, 10),
	(6163, 6, '테일러스튜디오(basic) FG 맨투맨',			5000, 'basic 맨투맨 M사이즈 입니다.', 0  , 16, 3, 10);
-- white = 1, ivory = 2, gray = 3, pink = 4, yellow =5, mint = 6
-- green = 7, purple = 8, navy = 9, black = 11, brown = 12, orange = 13, blue = 14, red=15, basic = 16

-- 제품 이미지
-- pro_img_state가 1이면 메인 이미지 0이면 보조 이미지
INSERT INTO proj21_shop.pro_img
		(pro_num, pro_imagefilename, pro_img_state)
values
		(1113, '1113.jpg', 1),
		(1033, '1033.jpg', 1),
		(1093, '1093.jpg', 1),
		(1143, '1143.jpg', 1),
		(1043, '1043.jpg', 1),
		(2093, '2093.jpg', 1),
		(2063, '2063.jpg', 1),
		(2123, '2123.jpg', 1),
		(2113, '2113.jpg', 1),
		(2023, '2023.jpg', 1),
		(3153, '3153.jpg', 1),
		(3123, '3123.jpg', 1),
		(3113, '3113.jpg', 1),
		(3143, '3143.jpg', 1),
		(3023, '3023.jpg', 1),
		(4043, '4043.jpg', 1),
		(4073, '4073.jpg', 1),
		(4093, '4093.jpg', 1),
		(4033, '4033.jpg', 1),
		(4113, '4113.jpg', 1),
		(5033, '5033.jpg', 1),
		(5023, '5023.jpg', 1),
		(5013, '5013.jpg', 1),
		(5053, '5053.jpg', 1),
		(5113, '5113.jpg', 1),
		(5083, '5083.jpg', 1),
		(6013, '6013.jpg', 1),
		(6093, '6093.jpg', 1),
		(6033, '6033.jpg', 1),
		(6023, '6023.jpg', 1),
		(6163, '6163.jpg', 1);
	
-- 여기 까지

-- 장바구니
INSERT INTO proj21_shop.cart
		(cart_member_Id, cart_pro_num, cart_pro_quantity)
values
		('test01', 6163, 1);

-- 주문 
INSERT INTO proj21_shop.`order`
(order_member_id, order_num, pro_num, order_member_name, order_pro_quantity, order_price, order_discount, receiver_name
, receiver_tel1, receiver_tel2, delivery_addr1, delivery_addr2, delivery_addr3, request_to_delivery, who_pay, which_bank)
values
('test01', 210530, 6163, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test02', 210530, 5083, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test02', 210530, 5013, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test03', 210531, 6163, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test03', 210531, 6163, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test03', 210531, 4073, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test04', 210531, 4093, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test04', 210532, 4033, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test05', 210532, 4113, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test05', 210532, 5033, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민'),
('test05', 210532, 5023, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678', 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민');

-- Q&A
INSERT INTO qna
(q_title, q_option, q_member, q_content, q_file)
values
('아니이게뭐죠?', '제품상담', 'test01', '이런 제품이 있나요? 말이 됩니까? 어떻게 하실껀가요?', '첨부파일'),
('반품관련공지', '공지', 'admin', '배송이 출발하면 반품이 안됩니다.', '첨부파일');

-- 후기
INSERT INTO review
(pro_num, re_member, re_content, re_image, re_image2, re_stars)
values
(6163, 'test01', '완전 싸고 좋습니다. 강추드립니다.', 'review_test.jpg', 'review_test.jpg', 5);

-- 후기 댓글 
INSERT INTO proj21_shop.re_reply
(re_num, re_rep_member,re_rep_content)
values
(1, 'test01','후기 감사합니다.');

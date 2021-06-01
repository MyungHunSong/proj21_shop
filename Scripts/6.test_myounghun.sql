-- Myoung Hun test script
/* q_option => 질문유형 1. 환불 요청 -> 파손 ~ 2. 공지사항
 * q_member => m_id =>세션에 잇는 정보를 통해 request처서 가져온다.
 *  q_hits => q_hits = q_hits+1 볼때마다 1식 올라가게 
 *  q_group => 질문번호 와 답글번호 => 질문번호에 대한 답글을 달면 q_group 질문번호의 숫자에 맞게 달림.
 * q_indent => 그 질문에대한 답글수.
 * q_step 말그대로 질문순서.
 */

SELECT * from qna;
select * from product;
select * from `order`;


-- 제품인서트
 insert
	into
	proj21_shop.`order` ( order_member_id ,
	order_num ,
	pro_num ,
	order_member_name ,
	order_pro_quantity ,
	order_price ,
	order_discount ,
	receiver_name ,
	receiver_tel1 ,
	receiver_tel2 ,
	delivery_addr ,
	delivery_addr_de ,
	delivery_status ,
	request_to_delivery ,
	order_date ,
	who_pay ,
	which_bank )
values( 'test01' ,
1 ,
1 ,
'이종윤' ,
2 ,
10000 ,
0 ,
'이종윤' ,
'010-1234-5678' ,
'010-1234-5678' ,
'대구광역시 남구 봉덕동 이천로 51' ,
'2층' ,
'배송완료' ,
'문앞' ,
now() ,
'이종윤' ,
'국민' 
);
======= 판매중이면 
, '판매중'
, '문앞'
, '2020-09-27'
, '이종윤'
, '국민'
, '111111111');

-- 1.qna작성시 인서트문이다.
insert into qna(q_title, q_option, q_member, q_content,q_group,q_file,q_date)
values('뭔놈의 타이틀','환불해도','Johns','니가 가밧냐 하와이?',0,'test.jpg',now());
-- 2. 주문번호 받아오기.
select * from `order`;



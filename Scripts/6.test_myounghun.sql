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
select * from `member`;


-- 제품인서트
 insert into 
 `order`(order_member_id, order_num, pro_num, order_pro_num, order_member_name, order_pro_quantity, order_price, order_discount, receiver_name, receiver_tel1
 ,delivery_addr1, delivery_addr2, delivery_addr3, delivery_status, request_to_delivery, order_date, who_pay, which_bank)
 values('test01',2003,6034,0,'항산화',2,500000,0,'호잇차','010-4444-4444','708-1421','대구 광역시 매여로 2길 58','219번지','배송중','안전하게 오세요',now()
 ,'송명훈','국민');
 
-- 1-1.qna작성시 인서트문이다.
insert into qna(q_title, q_option, q_member, q_content,q_group,q_file,q_date)
values('뭔놈의 타이틀','환불해도','Johns','니가 가밧냐 하와이?',0,'test.jpg',now());

-- 1-2. 주문번호 받아오기 -> 선택하기 누르면 조회창에 바로뜬다~.
-- 첫번째 꺼는 회원 페이지에 나오는 내용.
-- 두번째는 클릭시 번호가 넘어갸아한다.
select pi1.pro_imagefilename, p.pro_name, p.pro_content, o.pro_num, o.order_date 
from `order` o join product p on o.pro_num = p.pro_num
join pro_img pi1 on p.pro_num = pi1.pro_num
where p.pro_num = ?;
-- 요것이 주문번호가 넘어가게 해주는것.
select order_num from `order`
where pro_num = 0;

-- 1-3. 로그인을 햇다면 들어 가자마자 이름, 휴대전화, 이메일 다 뜸.
select m_name, m_phone, m_email from `member`
where m_id = 'test01';



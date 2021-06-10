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
select  q_member,q_title,q_date,q_hits,q_option from qna;
 
-- 1-1.qna작성시 인서트문이다.
insert into qna(q_title, q_option, q_member, q_content,q_group,q_file,q_date)
values('제발','취소요청','test01','아니 무슨 취소가 안댄다는 거죠? 아 배달 왓네요',0,'test.jpg',now());

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





/*2. 보기용 목록 */
-- qna 페이지에 들어갈시 먼저 볼수있는것들
-- 2-1공지사항추가
insert into qna(q_title, q_option, q_member, q_file, q_content ,q_group,q_date) 
values('아이디 도용 관련 사항입니다.', '공지사항', '김GM', 'text.jpg', '도용해서 스팸올리면 진짜 스팸으로 만들어 버립니다.', 0 ,now());

-- 2-2 공지사항일시 인덱스 번호를 공지로. 그리고 공지가 제일 위로 가게.
select  q_member, q_title, q_date, q_hits, q_option,
	case q_option
		when q_option = '공지' then q_index
		else '공지'
	end 'q_op'
from qna
order by q_option, q_date desc;

select * from qna;

-- 페이지 넘기기 q_step => 관련글 순서 즉 답글의 순서를 말한다.
-- q_group 은 관련있는 글들끼리 묶어 놓은것이다.
-- q_group 20이라면 => 같은 20이 쓴다면 이새끼는 답글단거 근데 멀로 구분하냐? q_step =1 이면 답글관련 q_step=0 이면 일반글 올린사람.
-- 페이지 0~ 10 까지
select q_index,q_title,q_option,q_member,q_content,q_file,q_date,q_hits,q_group,q_indent,q_step
	from qna 
	where q_index >0
	order by	q_index desc, q_date desc
limit 0, 10;

-- 페이지 토탈 카운트 구하기.
select
	count(*) 
	from qna;

-- 페이징 처리 목록	
select q_index,q_title,q_option,q_member,q_content,q_file,q_date,q_hits,q_group,q_indent,q_step,
		case q_option
	when q_option = '공지' then q_index 
		else '공지' 
	end 'q_op'
		from qna 
	where q_index >0
		order by	q_op desc, q_index desc , q_date desc
limit 10, 10;	
-- 페이징 총 갯수
select 
			count(q_index)  
		from qna
		where q_index > 0;
	

INSERT INTO qna
(q_title, q_option, q_member, q_content, q_file)
values
('요기요', '제품상담', 'test03', '환불이 안돼여..', '첨부파일'),
('앗항', '환불', 'test03', '먼데..', '첨부파일'),
('배고파', '뒤짐?', 'test04', '먼데..', '첨부파일'),
('앗항', '상태', 'test05', '먼데..', '첨부파일'),
('앗항', '환불', 'test06', '먼데..', '첨부파일'),
('앗항', '검거', 'test07', '먼데..', '첨부파일'),
('앗항', '금액', 'test08', '먼데..', '첨부파일'),
('앗항', '위문', 'test09', '먼데..', '첨부파일'),
('앗항', '제품상담', 'test10', 'ㄴㄴㄴㄴ먼데..', '첨부파일'),
('앗항', '제품건의', 'test11', '먼ㅎㅎㅎ데..', '첨부파일'),
('앗항', '환불요청', 'test12', '먼ㄷㄱㄷㄱ데..', '첨부파일'),
('앗항', '제품상담', 'test13', '먼ㄹㄹㄹ데..', '첨부파일'),
('앗항', '해돌라고', 'test14', '먼데..', '첨부파일'),
('앗항', '해돌라고', 'test15', '먼데..', '첨부파일'),
('앗항', '해돌라고', 'test16', '먼데..', '첨부파일'),
('반품관련공지', '공지', 'admin', '배송이 출발하면 반품이 안됩니다.', '첨부파일'),	
('환불관련공지', '공지', 'admin', '전화하세욧 환불 하시려믄.', '첨부파일');	


		

		

-- 2-3. 검색하고(클릭) 삭제[회원 전용].
select q_index, q_member, q_title, q_date, q_hits, q_option 
	from qna 
where q_option != '공지사항' and q_index = 1;

-- 2-3-1. 트랜잭션. 회원이 자기 댓글 삭제.
delete
from qna
where q_option != '공지사항' and q_member = 'test01';

-- 2-3-2. 그런다음에 관리자 댓글도 삭제 대야함
delete
from qna 
where q_option !='공지사항' and q_group = 7;

select *
 from qna
where q_option != '공지사항' and q_member = 'Johns';

-- 2-4. 조회수 증가.
update qna 
set q_hits = q_hits + 1
where q_index = 1;


/*3. 답글 작성시 보이는*/
-- 답글은 관리자가 달수있다.
-- (관리자)세션 권한이 있으면 ok, (회원)없다면 답글 작성이 안보이도록
-- 3-1. 관리자용 답글 
insert into qna(q_title, q_option, q_member, q_content,q_group ,q_date)
values('[re]뭔놈의 타이틀','환불해도','김GM','죄송합니다 고갱님 앞으로 이런 실수 없더록 하겟습니다.',7 ,now());

-- 3-2. 회원용 qna 삭제 (qna, 답글 같이 삭제 되야함)
delete from qna where q_index = 3;
delete from qna where q_group = 3;

-- 3-3. qna 검색창.
select * from qna where q_option like '%환불%';



select  case q_option,  q_member, q_title, q_date, q_hits,
		when q_option = '공지사항' then q_index
		else '공지'
	end '번호' 
from qna
order by q_option;


-- Myoung Hun test script
/* q_option => 질문유형 1. 환불 요청 -> 파손 ~ 2. 공지사항
  q_member => m_id =>세션에 잇는 정보를 통해 request처서 가져온다.
  q_hits => q_hits = q_hits+1 볼때마다 1식 올라가게 
  q_group => 질문번호 와 답글번호 => 질문번호에 대한 답글을 달면 q_group 질문번호의 숫자에 맞게 달림.
  q_indent => 그 질문에대한 답글수.
  q_step 말그대로 질문순서.
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
/*
 * 공지는 볼순 있는데 작성은 관리자만.
 검색어 넣기.
 '제품문의'
'환불문의'
'포인트 º 적립금'
'회원관련'
'기타'
'주문결제'*/

alter table qna auto_increment=1;
set @count = 0;
update qna set auto_increment q_index  = @count:=@count+1;



select q_index,q_title,q_option,q_member,q_content,q_file,q_date,q_hits,q_group,q_indent,q_step,
		case q_option
	when q_option = '공지' then q_index
		else '공지' 
	end 'q_op'
		from qna 
	where q_index > 0 and q_option = '제품문의' 
		order by	q_op desc, q_index desc , q_date desc
limit 1, 10;



delete 
	from qna
where q_index < 200;

INSERT INTO qna
	(q_title, q_option, q_member, q_content, q_file, q_date, q_group)
values
('요기요', '주문결제', 'test03', '환불이 안돼여..', '첨부파일', now(), q_group = q_index),
('요기요', '주문결제', 'test03', '환불이 안돼여..', '첨부파일', now(), q_group = q_index),
('앗항', '주문결제', 'test03', '잘못된거 같은데요?..', '첨부파일',now(),q_group = q_index),
('배고파', '주문결제?', 'test04', '돈이왜 500언더 빠져나가죠?..', '첨부파일',now(),q_group = q_index),
('이게뭐조', '주문결제', 'test05', '먼데..', '첨부파일',now(),q_group = q_index),
('할말이 없네요', '기타', 'test06', '먼데..', '첨부파일',now(),q_group = q_index),
('제흐발', '기타', 'test07', '먼데..', '첨부파일',now(),q_group = q_index),
('무엇이?', '기타', 'test08', '먼데..', '첨부파일',now(),q_group = q_index),
('제발', '기타', 'test09', '먼데..', '첨부파일',now(),q_group = q_index),
('이건', '기타', 'test20', 'ㅋㅋㅋㅋ어이가 없네..', '첨부파일',now(),q_group = q_index),
('회원때문에 올려요', '회원관련', 'test10', 'ㄴㄴㄴㄴ먼데..', '첨부파일',now(),q_group = q_index),
('발행', '회원관련', 'test11', '먼ㅎㅎㅎ데..', '첨부파일',now(),q_group = q_index),
('포인트에 관해서', '포인트 º 적립금', 'test12', '먼ㄷㄱㄷㄱ데..', '첨부파일',now(),q_group = q_index),
('돈얼마 싸인줄 어디서 아나요?', '포인트 º 적립금', 'test13', '먼ㄹㄹㄹ데..', '첨부파일',now(),q_group = q_index),
('답없네', '포인트 º 적립금', 'test14', '먼데..', '첨부파일',now(),q_group = q_index),
('앗항', '환불문의', 'test15', '먼데..', '첨부파일',now(),q_group = q_index),
('앗항', '환불문의', 'test16', '먼데..', '첨부파일',now(),q_group = q_index),
('앗항', '제품문의', 'test11', '오?', '첨부파일', now(),q_group = q_index),
('앗항', '제품문의', 'test31', '하...시바 일안하냐?', '첨부파일', now(),q_group = q_index),
('환불관련공지', '공지', 'admin', '전화하세욧 환불 하시려믄.', '첨부파일',now(),0);

-- ('반품관련공지', '공지', 'admin', '배송이 출발하면 반품이 안됩니다.', '첨부파일',now()),	
	

-- 페이징 총 갯수
select 
	count(q_index)  
	from qna
where q_index > 0;
	

INSERT INTO qna
	(q_title, q_option, q_member, q_content, q_file)
values
	('요기요', '제품문의', 'test04', '환불이 안돼여..', '첨부파일');


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


-- => 요5가지가. 회원관련 문의다.
-- 즉 저6가지 이외에는 콤보 박스에 들어가면 안된다. ㅇㅋ?*/
/*3. 회원이 할수 있는 추가, 수정, 삭제*/
select * from qna
where q_option='제품문의' and q_option != '공지사항';

select * from qna;



-- 인서트 q_index 랑 q_group 같아야 답글을 달떄 q_group으로 판단 할수 있다.
select * from qna;

insert into qna(q_member, q_option, q_title, q_content, q_date, q_hits, q_file,q_group)
values
('송명훈', '환불문의', '시바 이게멉니까?','실밥이 무슨 지렁이마냥 기어나와 있는데... ', now(), 0, 'text.jpg',q_index = q_group);

-- 답글 
insert into qna(q_member, q_option, q_title, q_content, q_date , q_group)
values('김태환', '머래노 병신이', '한심한 종자야', q_group = )

-- 수정.
update qna 
	set q_title='이건또 뭡니까?', q_content = '실밥만 터진게 아니네 ㅅㅂ..', q_file= 'text1.jpg', q_date = now() 
	where q_index = 88;

-- 삭제.
delete 
from qna
where q_index = 88 and q_member = '송명훈';


/*4. 답글 작성시 보이는*/
-- 답글은 관리자가 달수있다.
-- (관리자)세션 권한이 있으면 ok, (회원)없다면 답글 작성이 안보이도록
 

-- 1번째 인덱스로 셀렉트 번호찾고 내용보이기..
select  
	q_index,q_title,q_option,q_member,q_content,q_file,q_date,q_hits,q_group,q_indent,q_step
	from qna
where q_index = 1;

-- 관리자용 답글
-- 인덱스 번호를 받아서 답글 작성.
insert into qna(q_ ,q_content, q_date)
	values('');


-- 3-2. 회원용 qna 삭제 (qna, 답글 같이 삭제 되야함)
delete from qna where q_index = 3;
delete from qna where q_group = 3;

-- 3-3. qna 검색창.
select q_index,q_title,q_option,q_member,q_content,q_file,q_date,q_hits,q_group,q_indent,q_step,
			case q_option
				when q_option = '공지' then q_index 
				else '공지' 
			end 'q_op'
				from qna 
					where q_index >0 and q_option like concat('%', '결제', '%') and q_title like concat('%', '','%')
				order by	q_op desc, q_date desc;
				





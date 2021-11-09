-- 쇼핑몰_팀
/*DROP SCHEMA IF EXISTS proj21_shop;*/

-- 쇼핑몰_팀
/*CREATE SCHEMA proj21_shop;*/

-- 회원
CREATE TABLE proj21_shop.MEMBER (
	m_id          VARCHAR(100)  NOT NULL COMMENT '아이디', -- 아이디
	m_passwd      CHAR(41)      NOT NULL COMMENT '비밀번호', -- 비밀번호
	m_name        VARCHAR(100)  NOT NULL COMMENT '이름', -- 이름
	m_phone       VARCHAR(100)  NOT NULL COMMENT '전화번호', -- 전화번호
	m_birthday    DATETIME      NOT NULL COMMENT '생년월일', -- 생년월일
	m_gender      TINYINT       NOT NULL COMMENT '성별', -- 성별
	m_addr1       VARCHAR(100)  NOT NULL COMMENT '우편번호', -- 우편번호
	m_addr2       VARCHAR(500)  NOT NULL COMMENT '도로명', -- 주소
	m_addr3       VARCHAR(500)  NOT NULL COMMENT '상세주소', -- 상세주소
	m_question    VARCHAR(1000) NOT NULL COMMENT '본인확인질문', -- 본인확인질문
	m_answer      varchar(500)  NOT NULL COMMENT '본인확인답변', -- 본인확인답변
	m_email       VARCHAR(500)  NULL     COMMENT '이메일', -- 이메일
	m_join        DATETIME      default current_timestamp NULL     COMMENT 'default current_timestamp', -- 가입일
	m_point       INT           default 2000 NULL     COMMENT 'default 2000', -- 포인트
	m_total_buy   INT           default 0 NULL     COMMENT 'default 0', -- 누적사용액
	m_total_order INT           default 0 NULL     COMMENT 'default 0', -- 누적주문수
	m_total_login INT           default 0 NULL     COMMENT 'default 0', -- 로그인횟수
	m_exit        TINYINT       default 0 NULL     COMMENT 'default 0' -- 탈퇴여부
)
COMMENT '회원';

-- 회원
ALTER TABLE proj21_shop.MEMBER
	ADD CONSTRAINT PK_MEMBER -- 회원 기본키
		PRIMARY KEY (
			m_id -- 아이디
		);

-- Q&A
CREATE TABLE proj21_shop.QNA (
	q_index   INT           NOT NULL COMMENT 'auto_increment', -- 질문번호
	q_title   VARCHAR(500)  NOT NULL COMMENT '질문제목', -- 질문제목
	q_option  VARCHAR(100)  NULL     COMMENT '질문목록', -- 질문목록
	q_member  VARCHAR(100)  NOT NULL COMMENT 'm_Id', -- 질문작성자
	q_content VARCHAR(3000) NULL     COMMENT '질문내용', -- 질문내용
	q_file    VARCHAR(50)   NULL     COMMENT '질문파일', -- 질문파일
	q_date    DATETIME      default current_timestamp NULL     COMMENT 'default current_timestamp', -- 질문일
	q_hits    INT           default 0 NULL     COMMENT 'default 0', -- 질문조회수
	q_group   INT           default 0 NOT NULL COMMENT '질문그룹', -- 질문그룹
	q_indent  INT           default 0 NULL     COMMENT 'default 0', -- 질문레벨
	q_step    INT           default 0 NULL     COMMENT 'default 0' -- 질문순서
)
COMMENT 'Q&A';

-- Q&A
ALTER TABLE proj21_shop.QNA
	ADD CONSTRAINT PK_QNA -- Q&A 기본키
		PRIMARY KEY (
			q_index -- 질문번호
		);

ALTER TABLE proj21_shop.QNA
	MODIFY COLUMN q_index INT NOT NULL AUTO_INCREMENT COMMENT 'auto_increment';

-- 후기
CREATE TABLE proj21_shop.REVIEW (
	re_num        INT           NOT NULL COMMENT 'auto_increment', -- 후기번호
	pro_num       INT           NULL     COMMENT '제품번호', -- 제품번호
	re_member     VARCHAR(100)  NULL     COMMENT 'm_Id', -- 후기작성자
	re_content    VARCHAR(3000) NULL     COMMENT '후기내용', -- 후기내용
	re_image      VARCHAR(100) Null default 'noimage.jpg'    COMMENT '후기이미지', -- 후기이미지
	re_image2     VARCHAR(100)  NULL default 'noimage.jpg'    COMMENT '후기이미지2', -- 후기이미지2
	re_date       DATETIME      default current_timestamp NULL     COMMENT 'default current_timestamp', -- 후기일
	re_stars      INT           NULL     COMMENT '별점' -- 별점
)
COMMENT '후기';

-- 후기
ALTER TABLE proj21_shop.REVIEW
	ADD CONSTRAINT PK_REVIEW -- 후기 기본키
		PRIMARY KEY (
			re_num -- 후기번호
		);

ALTER TABLE proj21_shop.REVIEW
	MODIFY COLUMN re_num INT NOT NULL AUTO_INCREMENT COMMENT 'auto_increment';

-- 후기덧글
CREATE TABLE proj21_shop.RE_REPLY (
	re_rep_num    INT          NOT NULL COMMENT 'auto_increment', -- 덧글번호
	re_num        INT          NOT NULL COMMENT '후기번호', -- 후기번호
	re_rep_member VARCHAR(100) NULL     COMMENT 'm_Id', -- 덧글작성자
	re_rep_content VARCHAR(1000) null	comment '덧글내용',
	re_rep_date   DATETIME  default current_timestamp   NULL     COMMENT 'default current_timestamp' -- 덧글일
)
COMMENT '후기덧글';

-- 후기덧글
ALTER TABLE proj21_shop.RE_REPLY
	ADD CONSTRAINT PK_RE_REPLY -- 후기덧글 기본키
		PRIMARY KEY (
			re_rep_num -- 덧글번호
		);

ALTER TABLE proj21_shop.RE_REPLY
	MODIFY COLUMN re_rep_num INT NOT NULL AUTO_INCREMENT COMMENT 'auto_increment';

-- 장바구니
CREATE TABLE proj21_shop.CART (
	cart_num          INT          NOT NULL COMMENT 'auto_increment', -- 장바구니번호
	cart_member_Id    VARCHAR(100) NOT NULL COMMENT 'm_Id', -- 아이디
	cart_pro_num      INT          NOT NULL COMMENT '제품번호', -- 제품번호
	cart_pro_quantity INT          NULL     COMMENT '제품수량' -- 제품수량
)
COMMENT '장바구니';

-- 장바구니
ALTER TABLE proj21_shop.CART
	ADD CONSTRAINT PK_CART -- 장바구니 기본키
		PRIMARY KEY (
			cart_num -- 장바구니번호
		);

ALTER TABLE proj21_shop.CART
	MODIFY COLUMN cart_num INT NOT NULL AUTO_INCREMENT COMMENT 'auto_increment';

-- 제품
CREATE TABLE proj21_shop.PRODUCT (
	pro_num       INT           NOT NULL COMMENT '제품코드=카테고리+색상+사이즈', -- 제품번호
	pro_category  INT           NULL     COMMENT 'enum', -- 제품카테고리
	pro_name      VARCHAR(100)  NULL     COMMENT '제품이름', -- 제품이름
	pro_price     INT           NULL     COMMENT '제품가격', -- 제품가격
	pro_content   VARCHAR(1000) NULL     COMMENT '제품설명', -- 제품설명
	pro_salesrate INT           NULL     COMMENT '제품세일', -- 제품세일
	pro_cre_date  DATETIME      default current_timestamp NULL     COMMENT 'default current_timestamp', -- 제품생성일
	pro_status    VARCHAR(50)   default '신상' NULL     COMMENT 'default 신상', -- 제품상태
	pro_color     INT           NULL     COMMENT 'enum', -- 제품색상
	pro_size      INT           NULL     COMMENT 'enum', -- 제품사이즈
	pro_quantity  INT           NULL     COMMENT '제품수량', -- 제품수량
	pro_sold      INT           default 0 NULL     COMMENT 'default 0', -- 누적판매수
	pro_hits      INT           default 0 NULL     COMMENT 'default 0', -- 조회수
	re_replyCount INT           default 0 NULL     COMMENT '후기수' -- 후기수
)
COMMENT '제품';

-- 제품
ALTER TABLE proj21_shop.PRODUCT
	ADD CONSTRAINT PK_PRODUCT -- 제품 기본키
		PRIMARY KEY (
			pro_num -- 제품번호
		);

-- 제품이미지
CREATE TABLE proj21_shop.PRO_IMG (
	pro_num           INT          NULL     COMMENT '제품번호', -- 제품번호
	pro_img_code      INT          NOT NULL COMMENT 'auto_increment', -- 이미지번호
	pro_imagefilename VARCHAR(100) NULL     COMMENT '이미지', -- 이미지
	pro_img_state     TINYINT      default 1 NULL     COMMENT 'default 0' -- 메인이미지여부
)
COMMENT '제품이미지';

-- 제품이미지
ALTER TABLE proj21_shop.PRO_IMG
	ADD CONSTRAINT PK_PRO_IMG -- 제품이미지 기본키
		PRIMARY KEY (
			pro_img_code -- 이미지번호
		);

ALTER TABLE proj21_shop.PRO_IMG
	MODIFY COLUMN pro_img_code INT NOT NULL AUTO_INCREMENT COMMENT 'auto_increment';

-- 주문
CREATE TABLE proj21_shop.ORDER (
	order_code          INT           NOT NULL COMMENT 'auto_increment(1)', -- 주문코드
	order_member_id     VARCHAR(100)  NULL     COMMENT '주문자아이디', -- 주문자아이디
	pro_num             INT           NOT NULL COMMENT '1033', -- 제품번호
	order_pro_num       INT           NOT NULL COMMENT '주문번호', -- 주문번호
	order_member_name   VARCHAR(100)  NOT NULL COMMENT '주문자이름', -- 주문자이름
	order_pro_quantity  INT           NULL     COMMENT '주문수량', -- 주문수량
	order_price         INT           NULL     COMMENT '주문총금액', -- 주문총금액
	order_discount      INT           NULL     COMMENT '총할인금액', -- 총할인금액
	receiver_name       VARCHAR(100)  NOT NULL COMMENT '수령자이름', -- 수령자이름
	receiver_tel1       VARCHAR(100)  NOT NULL COMMENT '수령자번호', -- 수령자번호
	receiver_tel2       VARCHAR(100)  NULL     COMMENT '임시번호', -- 임시번호
	delivery_addr1      VARCHAR(500)  NOT NULL COMMENT '우편번호', -- 우편번호
	delivery_addr2      VARCHAR(500)  NOT NULL COMMENT '배송주소', -- 배송주소
	delivery_addr3      VARCHAR(500)  NOT NULL COMMENT '배송상세주소', -- 배송상세주소
	delivery_status     VARCHAR(100) default '배송준비중' NULL     COMMENT 'default 배송준비중', -- 배송상태
	request_to_delivery VARCHAR(1000) NULL     COMMENT '배송참고사항', -- 배송참고사항
	order_date          DATETIME  default current_timestamp  NOT NULL COMMENT 'default current_timestamp', -- 주문일
	who_pay             VARCHAR(100)  NULL     COMMENT '결제자', -- 결제자
	which_bank          VARCHAR(100)  NULL     COMMENT '결제은행' -- 결제은행
)
COMMENT '주문';

-- 주문
ALTER TABLE proj21_shop.ORDER
	ADD CONSTRAINT PK_ORDER -- 주문 기본키
		PRIMARY KEY (
			order_code -- 주문코드
		);

ALTER TABLE proj21_shop.ORDER
	MODIFY COLUMN order_code INT NOT NULL AUTO_INCREMENT COMMENT 'auto_increment(1)';

-- 주소
CREATE TABLE proj21_shop.Address (
	addr_num INT          NOT NULL COMMENT '주소번호', -- 주소번호
	m_id     VARCHAR(100) NOT NULL COMMENT '아이디', -- 아이디
	m_addr1  VARCHAR(100) NOT NULL COMMENT '우편번호', -- 우편번호
	m_addr2  VARCHAR(100) NOT NULL COMMENT '주소', -- 주소
	m_addr3  VARCHAR(100) NULL     COMMENT '상세주소' -- 상세주소
)
COMMENT '주소';

-- 주소
ALTER TABLE proj21_shop.Address
	ADD CONSTRAINT PK_Address -- 주소 기본키
		PRIMARY KEY (
			addr_num -- 주소번호
		);

ALTER TABLE proj21_shop.Address
	MODIFY COLUMN addr_num INT NOT NULL AUTO_INCREMENT COMMENT '주소번호';

-- 후기
ALTER TABLE proj21_shop.REVIEW
	ADD CONSTRAINT FK_PRODUCT_TO_REVIEW -- 제품 -> 후기
		FOREIGN KEY (
			pro_num -- 제품번호
		)
		REFERENCES proj21_shop.PRODUCT ( -- 제품
			pro_num -- 제품번호
		);

-- 후기덧글
ALTER TABLE proj21_shop.RE_REPLY
	ADD CONSTRAINT FK_REVIEW_TO_RE_REPLY -- 후기 -> 후기덧글
		FOREIGN KEY (
			re_num -- 후기번호
		)
		REFERENCES proj21_shop.REVIEW ( -- 후기
			re_num -- 후기번호
		);

-- 장바구니
ALTER TABLE proj21_shop.CART
	ADD CONSTRAINT FK_PRODUCT_TO_CART -- 제품 -> 장바구니
		FOREIGN KEY (
			cart_pro_num -- 제품번호
		)
		REFERENCES proj21_shop.PRODUCT ( -- 제품
			pro_num -- 제품번호
		);

-- 장바구니
ALTER TABLE proj21_shop.CART
	ADD CONSTRAINT FK_MEMBER_TO_CART -- 회원 -> 장바구니
		FOREIGN KEY (
			cart_member_Id -- 아이디
		)
		REFERENCES proj21_shop.MEMBER ( -- 회원
			m_id -- 아이디
		);

-- 제품이미지
ALTER TABLE proj21_shop.PRO_IMG
	ADD CONSTRAINT FK_PRODUCT_TO_PRO_IMG -- 제품 -> 제품이미지
		FOREIGN KEY (
			pro_num -- 제품번호
		)
		REFERENCES proj21_shop.PRODUCT ( -- 제품
			pro_num -- 제품번호
		);

-- 주문
ALTER TABLE proj21_shop.ORDER
	ADD CONSTRAINT FK_MEMBER_TO_ORDER -- 회원 -> 주문
		FOREIGN KEY (
			order_member_id -- 주문자아이디
		)
		REFERENCES proj21_shop.MEMBER ( -- 회원
			m_id -- 아이디
		);

-- 주문
ALTER TABLE proj21_shop.ORDER
	ADD CONSTRAINT FK_PRODUCT_TO_ORDER -- 제품 -> 주문
		FOREIGN KEY (
			pro_num -- 제품번호
		)
		REFERENCES proj21_shop.PRODUCT ( -- 제품
			pro_num -- 제품번호
		);

-- 주소
ALTER TABLE proj21_shop.Address
	ADD CONSTRAINT FK_MEMBER_TO_Address -- 회원 -> 주소
		FOREIGN KEY (
			m_id -- 아이디
		)
		REFERENCES proj21_shop.MEMBER ( -- 회원
			m_id -- 아이디
		);
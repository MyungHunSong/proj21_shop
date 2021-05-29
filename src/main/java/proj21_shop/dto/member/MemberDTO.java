package proj21_shop.dto.member;

import java.sql.Date;

public class MemberDTO {
	
	private String member_id;
	private String member_pwd;
	private String member_pwd_confirm; //비밀번호확인
	private String member_name;
	private String member_hp;
	private String member_birth;
	private String member_gender;
	private String member_pwd_q; //본인확인질문
	private String member_pwd_a; //본인확인질문답변
	private String member_email;
	private Date member_cre_date;
	private int member_point;
	private int member_total_buy;
	private int member_total_order;
	private int member_total_login;
	private int member_exit; // 0(=defult) 1(=exit)
	
}

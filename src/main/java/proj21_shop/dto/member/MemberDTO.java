package proj21_shop.dto.member;

import java.sql.Date;
import java.time.LocalDateTime;

public class MemberDTO {
	
	private String memberId;
	private String memberPwd;
	
	private String memberPwdConfirm; //비밀번호확인
	
	private String memberName;
	private String memberHp;
	private LocalDateTime memberBirth;
	
	private Gender memberGender; //0=남자 1=여자
	
	private String memberPwdQ; //본인확인질문
	private String memberPwdA; //본인확인질문답변
	private String memberAddr1; //우편번호
	private String memberAddr2; //주소(도로명)
	private String memberAddr3; //상세주소
	private String memberAmail;
	private Date memberCreDate;
	private int memberPoint;
	private int memberTotalBuy;
	private int memberTotalOrder;
	private int memberTotalLogin;
	
	private int memberExit; // 0(=defult) 1(=exit)
	
}

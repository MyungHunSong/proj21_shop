package proj21_shop.dto.member;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

	private String memberId;
	private String memberPwd;

	private String memberPwdConfirm; // 비밀번호확인

	private String memberName;
	private String memberPh;
	private LocalDate memberBirth;

	private Gender memberGender; // 0=남자 1=여자

	private String memberPwdQ; // 본인확인질문
	private String memberPwdA; // 본인확인질문답변
	private String memberAddr1; // 우편번호
	private String memberAddr2; // 주소(도로명)
	private String memberAddr3; // 상세주소
	private String memberEmail;
	private Date memberCreDate;
	private int memberPoint;
	private int memberTotalBuy;
	private int memberTotalOrder;
	private int memberTotalLogin;

	private int memberExit; // 0(=defult) 1(=exit)

	public MemberDTO() {
	}

	public MemberDTO(String memberId, int memberExit) {
		super();
		this.memberId = memberId;
		this.memberExit = memberExit;
	}

	public MemberDTO(String memberId, String memberPh, String memberAddr1, String memberAddr2, String memberAddr3, String memberEmail) {
		super();
		this.memberId = memberId;
		this.memberPh = memberPh;
		this.memberAddr1 = memberAddr1;
		this.memberAddr2 = memberAddr2;
		this.memberAddr3 = memberAddr3;
		this.memberEmail = memberEmail;
	}

	public MemberDTO(String memberId, String memberPwd, String memberName, String memberPh, LocalDate memberBirth, Gender memberGender,
			String memberPwdQ, String memberPwdA, String memberAddr1, String memberAddr2, String memberAddr3, String memberEmail) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPh = memberPh;
		this.memberBirth = memberBirth;
		this.memberGender = memberGender;
		this.memberPwdQ = memberPwdQ;
		this.memberPwdA = memberPwdA;
		this.memberAddr1 = memberAddr1;
		this.memberAddr2 = memberAddr2;
		this.memberAddr3 = memberAddr3;
		this.memberEmail = memberEmail;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberPwdConfirm() {
		return memberPwdConfirm;
	}

	public void setMemberPwdConfirm(String memberPwdConfirm) {
		this.memberPwdConfirm = memberPwdConfirm;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPh() {
		return memberPh;
	}

	public void setMemberPh(String memberPh) {
		this.memberPh = memberPh;
	}

	public LocalDate getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(LocalDate memberBirth) {
		this.memberBirth = memberBirth;
	}

	public Gender getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(Gender memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPwdQ() {
		return memberPwdQ;
	}

	public void setMemberPwdQ(String memberPwdQ) {
		this.memberPwdQ = memberPwdQ;
	}

	public String getMemberPwdA() {
		return memberPwdA;
	}

	public void setMemberPwdA(String memberPwdA) {
		this.memberPwdA = memberPwdA;
	}

	public String getMemberAddr1() {
		return memberAddr1;
	}

	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}

	public String getMemberAddr2() {
		return memberAddr2;
	}

	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}

	public String getMemberAddr3() {
		return memberAddr3;
	}

	public void setMemberAddr3(String memberAddr3) {
		this.memberAddr3 = memberAddr3;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getMemberCreDate() {
		return memberCreDate;
	}

	public void setMemberCreDate(Date memberCreDate) {
		this.memberCreDate = memberCreDate;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public int getMemberTotalBuy() {
		return memberTotalBuy;
	}

	public void setMemberTotalBuy(int memberTotalBuy) {
		this.memberTotalBuy = memberTotalBuy;
	}

	public int getMemberTotalOrder() {
		return memberTotalOrder;
	}

	public void setMemberTotalOrder(int memberTotalOrder) {
		this.memberTotalOrder = memberTotalOrder;
	}

	public int getMemberTotalLogin() {
		return memberTotalLogin;
	}

	public void setMemberTotalLogin(int memberTotalLogin) {
		this.memberTotalLogin = memberTotalLogin;
	}

	public int getMemberExit() {
		return memberExit;
	}

	public void setMemberExit(int memberExit) {
		this.memberExit = memberExit;
	}

	public boolean matchPassword(String password) {
		System.out.println("this.memberPwd : " + this.memberPwd);
		System.out.println("password : " + password);
		return this.memberPwd.equals(password);
	}

	@Override
	public String toString() {
		return String.format(
				"MemberDTO [memberId=%s, memberPwd=%s, memberPwdConfirm=%s, memberName=%s, memberPh=%s, memberBirth=%s, memberGender=%s, memberPwdQ=%s, memberPwdA=%s, memberAddr1=%s, memberAddr2=%s, memberAddr3=%s, memberEmail=%s, memberCreDate=%s, memberPoint=%s, memberTotalBuy=%s, memberTotalOrder=%s, memberTotalLogin=%s, memberExit=%s]",
				memberId, memberPwd, memberPwdConfirm, memberName, memberPh, memberBirth, memberGender, memberPwdQ, memberPwdA, memberAddr1,
				memberAddr2, memberAddr3, memberEmail, memberCreDate, memberPoint, memberTotalBuy, memberTotalOrder, memberTotalLogin, memberExit);
	}

}

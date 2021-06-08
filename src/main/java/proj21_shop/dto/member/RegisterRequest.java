package proj21_shop.dto.member;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class RegisterRequest {
	private String memberName;
	private String memberId;
	private String memberPwd;
	private String memberPwdConfirm;
	private String memberEmail;
	private String memberPh;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate memberBirth;
	private Gender memberGender;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private String memberPwdQ;
	private String memberPwdA;

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
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

	@Override
	public String toString() {
		return String.format(
				"RegisterRequest [memberName=%s, memberId=%s, memberPwd=%s, memberPwdConfirm=%s, memberEmail=%s, memberPh=%s, memberBirth=%s, memberGender=%s, memberAddr1=%s, memberAddr2=%s, memberAddr3=%s, memberPwdQ=%s, memberPwdA=%s]",
				memberName, memberId, memberPwd, memberPwdConfirm, memberEmail, memberPh, memberBirth, memberGender,
				memberAddr1, memberAddr2, memberAddr3, memberPwdQ, memberPwdA);
	}

}

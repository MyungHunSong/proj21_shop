package proj21_shop.dto.member;


public class ModifyRequest {
	private String memberId;
	private String memberEmail;
	private String memberPh;
	private String memberPwdQ;
	private String memberPwdA;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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


	@Override
	public String toString() {
		return String.format(
				"ModifyRequest [memberEmail=%s, memberPh=%s, memberPwdQ=%s, memberPwdA=%s, memberAddr1=%s, memberAddr2=%s, memberAddr3=%s]",
				memberEmail, memberPh, memberPwdQ, memberPwdA, memberAddr1, memberAddr2, memberAddr3);
	}

}

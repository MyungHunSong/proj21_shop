package proj21_shop.dto.member;

public class DeleteRequest {
	private String password;
	private String passConfirm;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassConfirm() {
		return passConfirm;
	}

	public void setPassConfirm(String passConfirm) {
		this.passConfirm = passConfirm;
	}

	@Override
	public String toString() {
		return String.format("DeleteRequest [password=%s, passConfirm=%s]", password, passConfirm);
	}
	
	

}

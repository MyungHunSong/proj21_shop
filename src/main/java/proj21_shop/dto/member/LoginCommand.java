package proj21_shop.dto.member;

public class LoginCommand {
	private String Id;
	private String password;
	private boolean rememberId;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isRememberId() {
		return rememberId;
	}

	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}

	@Override
	public String toString() {
		return String.format("LoginCommand [Id=%s, password=%s, rememberId=%s]", Id, password, rememberId);
	}

}

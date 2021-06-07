package proj21_shop.dto.errorresponse;

public class ErrorResponse {

	private String message;
	
	public ErrorResponse() {
	}

	public ErrorResponse(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}
	
}

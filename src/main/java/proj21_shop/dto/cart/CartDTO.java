package proj21_shop.dto.cart;

public class CartDTO {
	private int cartNum;
	private int cartMemberId;
	private int cartProNum;
	private int cartProQuantity;

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public int getCartMemberId() {
		return cartMemberId;
	}

	public void setCartMemberId(int cartMemberId) {
		this.cartMemberId = cartMemberId;
	}

	public int getCartProNum() {
		return cartProNum;
	}

	public void setCartProNum(int cartProNum) {
		this.cartProNum = cartProNum;
	}

	public int getCartProQuantity() {
		return cartProQuantity;
	}

	public void setCartProQuantity(int cartProQuantity) {
		this.cartProQuantity = cartProQuantity;
	}

}

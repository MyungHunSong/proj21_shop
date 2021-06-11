package proj21_shop.dto.cart;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.product.ProductDTO;

public class CartDTO {
	private int cartNum;
	private MemberDTO memberId;
	private ProductDTO cartProNum;
	private int cartProQuantity;

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public MemberDTO getMemberId() {
		return memberId;
	}

	public void setMemberId(MemberDTO memberId) {
		this.memberId = memberId;
	}


	public ProductDTO getCartProNum() {
		return cartProNum;
	}

	public void setCartProNum(ProductDTO cartProNum) {
		this.cartProNum = cartProNum;
	}

	public int getCartProQuantity() {
		return cartProQuantity;
	}

	public void setCartProQuantity(int cartProQuantity) {
		this.cartProQuantity = cartProQuantity;
	}

	@Override
	public String toString() {
		return String.format("cartNum=%s memberId=%s cartProNum=%s cartProQuantity=%s", cartNum, memberId,
				cartProNum, cartProQuantity);
	}

}

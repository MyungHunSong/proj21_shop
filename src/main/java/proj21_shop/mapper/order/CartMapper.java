package proj21_shop.mapper.order;

import java.util.List;

import proj21_shop.dto.cart.CartDTO;

public interface CartMapper {
	/* 장바구니 제품 여부 */
	String flagInCart(String MemberId);
	
	/* 장바구니에서 아이디로 검색 한 목록 */
	List<CartDTO> selectCartByMemberId(CartDTO memId);
	
	/* 장바구니에서 선택된 항목 주문페이지로 검색 */
	List<CartDTO> chooseCartByMemberId(List<Integer> cartNum);
	
	
	int insertCart(CartDTO cart);
	int deleteCart(int cartNum);
	int deleteCarts(List<Integer> list);
	int updateCart(CartDTO cart);

}

package proj21_shop.mapper.order;

import java.util.List;

import proj21_shop.dto.cart.CartDTO;

public interface CartMapper {
	/* 장바구니 제품 여부 */
	String flagInCart(String MemberId);
	
	/* 장바구니에서 회원아이디로 검색 한 목록 */
	List<CartDTO> selectCartByMemberId(CartDTO memId);
	
	/* 장바구니에서 선택된 항목 주문페이지로 검색 */
	List<CartDTO> chooseCartByMemberId(List<Integer> cartNum);
	
	/*장바구니 항목 추가*/
	int insertCart(CartDTO cart);
	
	/*장바구니 개별 삭제*/
	int deleteCart(int cartNum);
	
	/*장바구니번호를 리스트로 받아 한번에 여러개 삭제*/
	int deleteCarts(List<Integer> list);
	
	/*장바구니 수량 수정*/
	int updateCart(CartDTO cart);

}

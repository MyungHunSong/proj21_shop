package proj21_shop.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;


@Service
public interface CartService {
	/* 장바구니에서 회원아이디로 검색 한 목록 */
	List<CartDTO> showCartsByMemberId(CartDTO memId);
	
	/* 장바구니에서 선택된 항목 주문페이지로 검색 (선택된 항목들만 주문페이지로 이동할수 있도록 함)*/
	List<CartDTO> chooseCartByMemberId(List<Integer> cartNum);
	
	/*장바구니 항목 추가*/
	int insertCart(CartDTO cart);
	
	/*장바구니 개별 삭제*/
	int deleteCart(int cartNum);
	
	/*장바구니번호를 리스트로 받아 한번에 여러개 삭제*/
	int deleteCarts(List<Integer> list);
	
	/*장바구니 수량 수정*/
	int updateCart(CartDTO cart);
	
	/*바로 구입하기 버튼을 사용할경우
	 * (회원 아이디로 제품이 있나 검색한후 있으면 장바구니의 제품을 업데이트(수량만) 없으면 장바구니에 인서트후 구매페이지로 이동)*/
	List<Integer> useProductOrderBtn(CartDTO cart);
}

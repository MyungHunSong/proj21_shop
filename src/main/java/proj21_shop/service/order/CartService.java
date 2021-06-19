package proj21_shop.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;


@Service
public interface CartService {
	List<CartDTO> showCartsByMemberId(CartDTO memId);
	
	/* 장바구니에서 선택된 항목 주문페이지로 검색 */
	List<CartDTO> chooseCartByMemberId(List<Integer> cartNum);
	
	int insertCart(CartDTO cart);
	int deleteCart(int cartNum);
	int deleteCarts(List<Integer> list);
	int updateCart(CartDTO cart);
	
	List<Integer> useProductOrderBtn(CartDTO cart);
}

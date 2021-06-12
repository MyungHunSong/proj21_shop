package proj21_shop.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;


@Service
public interface CartService {
	List<CartDTO> showCartsByMemberId(CartDTO memId);
	
	int insertCart(CartDTO cart);
	int deleteCart(int cartNum);
	int deleteCarts(List<Integer> list);
	int updateCart(CartDTO cart);
}

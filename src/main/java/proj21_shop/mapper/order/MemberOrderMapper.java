package proj21_shop.mapper.order;

import java.util.List;

import proj21_shop.dto.cart.CartDTO;

public interface MemberOrderMapper {
	List<CartDTO> selectCartByMemberId(CartDTO memId);
	
	int insertCart(CartDTO cart);
	int deleteCart(int cartNum);
	int deleteCarts(List<Integer> list);
	int updateCart(CartDTO cart);
}

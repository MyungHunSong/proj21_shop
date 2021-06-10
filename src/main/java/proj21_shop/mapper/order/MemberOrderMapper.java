package proj21_shop.mapper.order;

import java.util.List;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;

public interface MemberOrderMapper {
	List<CartDTO> selectCartByMemberId(MemberDTO memId);
	CartDTO selectCartByCartNum(CartDTO cart);
	
	int insertCart(CartDTO cart);
	int deleteCart(int cartNum);
	int deleteCarts(List<Integer> map);
	int updateCart(CartDTO cart);
}

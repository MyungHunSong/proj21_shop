package proj21_shop.mapper.member.order;

import java.util.List;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;

public interface MemberOrderMapper {
	List<CartDTO> selectCartByMemberId(MemberDTO memId);

	int insertCart(CartDTO cart);
	int deleteCart(int cartNum);
}

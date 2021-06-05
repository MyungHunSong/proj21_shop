package proj21_shop.service.member.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;


@Service
public interface MemberOrderService {
	List<CartDTO> showCartsByMemberId(MemberDTO memId);

	int insertCart(CartDTO cart);
	int deleteCart(int proName);
}

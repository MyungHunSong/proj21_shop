package proj21_shop.service.impl.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.exception.MemberNotLoginException;
import proj21_shop.mapper.order.MemberOrderMapper;
import proj21_shop.service.order.MemberOrderService;

@Service
public class MemberOrderServiceImpl implements MemberOrderService {

	@Autowired
	private MemberOrderMapper mapper;

	@Override
	public List<CartDTO> showCartsByMemberId(MemberDTO memId) {
		if (memId == null) {
			throw new MemberNotLoginException();
		}
		List<CartDTO> list = mapper.selectCartByMemberId(memId);
		return list;
	}
 
	@Override
	public int insertCart(CartDTO cart) {
		int res = mapper.insertCart(cart);
		return res;
	}

	@Override
	public int deleteCart(int cartNum) {
		return mapper.deleteCart(cartNum);
	}

	@Override
	public CartDTO selectCartByPronum(CartDTO cart) {
		return mapper.selectCartByPronum(cart);
	}

	@Override
	public int updateCart(CartDTO cart) {
		return mapper.updateCart(cart);
	}

}

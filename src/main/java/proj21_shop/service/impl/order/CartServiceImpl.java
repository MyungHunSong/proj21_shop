package proj21_shop.service.impl.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.exception.MemberNotLoginException;
import proj21_shop.mapper.order.CartMapper;
import proj21_shop.service.order.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;

	@Override
	public List<CartDTO> showCartsByMemberId(CartDTO memId) {
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
	public int updateCart(CartDTO cart) {
		return mapper.updateCart(cart);
	}

	@Override
	public int deleteCarts(List<Integer> list) {
		return mapper.deleteCarts(list);
	}

	@Override
	public List<CartDTO> chooseCartByMemberId(List<Integer> cartNum) {
		return mapper.chooseCartByMemberId(cartNum);
	}

}

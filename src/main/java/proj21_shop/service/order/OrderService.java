package proj21_shop.service.order;

import org.springframework.stereotype.Service;

import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;

@Service
public interface OrderService {

	/* 회원아이디로 검색후 기존 회원 정보 자동으로 설정*/
	MemberDTO selectById(String id);
	
	void trInsertOrder(OrderDTO orderDTO);
}

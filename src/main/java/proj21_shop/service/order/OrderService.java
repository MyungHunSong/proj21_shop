package proj21_shop.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;

@Service
public interface OrderService {

	/* 회원아이디로 검색후 기존 회원 정보 자동으로 설정*/
	int selectLastCartNum();

	MemberDTO selectById(String id);
	
	int trInsertOrder(List<OrderDTO> orderDTO);
	
}

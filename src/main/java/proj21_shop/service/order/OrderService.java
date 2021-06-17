package proj21_shop.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;

@Service
public interface OrderService {

	/*주문완료후 주문상세페이지로 이동하기 위해 주문번호 중 마지막 번호를 찾아서 넣어준다.*/
	int selectLastOrderNum();
	
	/*주문하기 버튼을 누르면 바로 카트에 담는데 주문페이지애서 마지막 번호로 검색해서 제품 생성*/
	
	int selectLastCartNum();

	/* 회원아이디로 검색후 기존 회원 정보 자동으로 설정*/
	
	MemberDTO selectById(String id);

	/*주문하기 트랜잭션용*/
	
	int trInsertOrder(List<OrderDTO> orderDTO);
	
}

package proj21_shop.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.service.order.OrderService;


@RestController
@RequestMapping("/api")
public class OrderServiceController {

	@Autowired
	private OrderService service;
	
	/* 기존 회원 정보 set */ 
	@GetMapping("/existOrderMember/{memberId}")
	public ResponseEntity<Object> getCarts(@PathVariable String memberId){
		MemberDTO member = service.selectById(memberId);
		return ResponseEntity.ok(member);
	}
	
	/*주문 테이블에 제품 등록*/
	@PostMapping("/orderInfo")
	public ResponseEntity<Object> getOrderInfo(@RequestBody List<OrderDTO> orderDTO){
		System.out.println(orderDTO);
		return ResponseEntity.ok(service.trInsertOrder(orderDTO));
	}
	
	/*제품 구입 완료 후 이동하는 페이지에서 마지막 주문 번호를 검색해서 들어간다.*/
	@GetMapping("/lastOrderNum")
	public ResponseEntity<Object> getLastOrderNum(){
		return ResponseEntity.ok(service.selectLastOrderNum());
	}
	
	
}

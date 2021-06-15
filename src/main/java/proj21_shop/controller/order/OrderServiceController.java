package proj21_shop.controller.order;

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
	public ResponseEntity<Object> getOrderInfo(@RequestBody OrderDTO orderDTO){
		System.out.println(orderDTO);
		return ResponseEntity.ok(service.trInsertOrder(orderDTO));
	}
}

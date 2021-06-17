package proj21_shop.controller.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.service.order.CartService;
import proj21_shop.service.order.OrderService;


@RestController
@RequestMapping("/api")
public class OrderServiceController {

	@Autowired
	private OrderService service;
	
	@Autowired
	private CartService cartService;
	
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
	
	@GetMapping("/lastCartNum")
	public ResponseEntity<Object> getLastCartNum(HttpSession session){
		List<Integer> cart = new ArrayList<Integer>();
		int cartNum = service.selectLastCartNum();
		cart.add(cartNum);
		List<CartDTO> list = cartService.chooseCartByMemberId(cart);
		session.setAttribute("cartNums", cartNum);
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("/lastOrderNum")
	public ResponseEntity<Object> getLastOrderNum(){
		return ResponseEntity.ok(service.selectLastOrderNum());
	}
}

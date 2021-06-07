package proj21_shop.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.service.order.MemberOrderService;

@RestController
@RequestMapping("/api")
public class orderServiceController {
 
	@Autowired
	private MemberOrderService service;
	
//	/* 장바구니 */
	/* 장바구니 목록 */
	@GetMapping("/memberProductCart/{memId}")
	public ResponseEntity<Object> getCarts(@PathVariable String memId){
		MemberDTO mem = new MemberDTO();
		mem.setMemberId(memId);
		List<CartDTO> list = service.showCartsByMemberId(mem);
		return ResponseEntity.ok(list);
	}

	/* 장바구니 삭제 */
	@DeleteMapping("/memberProductCart/{cart_num}")
	public ResponseEntity<Object> delCartByProName(@PathVariable int cart_num){
		return ResponseEntity.ok(service.deleteCart(cart_num));
	}
	
	/* 장바구니 추가 */
	@PostMapping("/memberProductCart")
	public ResponseEntity<Object> insertCart(@RequestBody CartDTO cart){
		System.out.println(cart);
		if(service.selectCartByPronum(cart) == null) {
			return ResponseEntity.ok(service.insertCart(cart));	
		}else if(service.selectCartByPronum(cart) != null){
			return ResponseEntity.ok(service.updateCart(cart));
		}
		return null;
	}
}

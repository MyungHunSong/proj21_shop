package proj21_shop.controller.order;

import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.AuthInfo;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.service.order.MemberOrderService;

@RestController
@RequestMapping("/api")
public class OrderServiceController {
 
	@Autowired
	private MemberOrderService service;
	
	/* 장바구니 */
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
	public ResponseEntity<Object> delCartByCartNum(@PathVariable int cart_num){
		return ResponseEntity.ok(service.deleteCart(cart_num));
	}
	
	/* 장바구니 항목 여러개 검색 */
	@GetMapping("/memberProductCarts")
	public ResponseEntity<Object> delCartsByCartNums(@PathVariable String cart_num){
		/*cart_num = "[23,43,25]"*/ 
		System.out.println(cart_num);
		return null;
	}
	
	/* 장바구니 추가 */
	@PostMapping("/memberProductCart/")
	public ResponseEntity<Object> insertCart(@RequestBody CartDTO cart){
		service.insertCart(cart);
		URI  uri = URI.create("/api/memberProductCart"+cart.getMemberId().getMemberId());
		return ResponseEntity.created(uri).body(cart.getMemberId().getMemberId());	
	}
	
	/* 장바구니 수량 변경 */
	@PatchMapping("/memberProductCart/{pro_num}")
	public ResponseEntity<Object> updateCartByProductName(@PathVariable int pro_num, @RequestBody CartDTO cart){
		System.out.println(cart);
		if(service.selectCartByPronum(cart) != null) {
			return ResponseEntity.ok(service.updateCart(cart));
		}else {
			System.out.println("변경 실패");
			return null;	
		}
	}
}

package proj21_shop.controller.order;

import java.net.URI;
import java.util.List;

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
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.mapper.order.MemberOrderMapper;
import proj21_shop.service.order.MemberOrderService;

@RestController
@RequestMapping("/api")
public class OrderServiceController {
 
	@Autowired
	private MemberOrderService service;
	
	@Autowired 
	private MemberOrderMapper mapper;
	
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
	
	/* 장바구니 항목 리스트로 검색 후 삭제*/
	@PostMapping("/memberProductCarts")
	public ResponseEntity<Object> delCartsByCartNums(@RequestBody List<Integer> cart_num){
		/*cart_num = "[23,43,25]"*/ 
		return ResponseEntity.ok(mapper.deleteCarts(cart_num));
	}
	
	/* 장바구니 추가 */
	@PostMapping("/memberProductCart/")
	public ResponseEntity<Object> insertCart(@RequestBody CartDTO cart){
		service.insertCart(cart);
		URI  uri = URI.create("/api/memberProductCart"+cart.getMemberId().getMemberId());
		return ResponseEntity.created(uri).body(cart.getMemberId().getMemberId());	
	}
	
	/* 장바구니 수량 변경 */
	@PatchMapping("/memberProductCart/{cartNum}")
	public ResponseEntity<Object> updateCartByProductName(@PathVariable int cartNum, @RequestBody CartDTO cart){
		if(service.selectCartByCartNum(cart) != null) {
			return ResponseEntity.ok(service.updateCart(cart));
		}else {
			System.out.println("변경 실패");
			return null;	
		}
	}
	
}

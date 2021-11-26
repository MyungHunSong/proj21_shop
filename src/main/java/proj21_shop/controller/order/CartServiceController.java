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
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.service.order.CartService;

@RestController
@RequestMapping("/api")
public class CartServiceController {
  
	@Autowired
	private CartService service;
	
	/* 장바구니 */
	/* 장바구니 목록 */
	// memberPorductCart.jsp에  cart목록에 데이터를 뿌려준다.
	@GetMapping("/memberProductCart/{memId}")
	public ResponseEntity<Object> getCarts(@PathVariable String memId){
		MemberDTO mem = new MemberDTO();
		mem.setMemberId(memId);
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(mem);
		
		System.out.println("here is CartService => " + (cart));
		
		List<CartDTO> list = service.showCartsByMemberId(cart);
		
		return ResponseEntity.ok(list);
	}

	/* 장바구니 삭제  (단일 형식으로)*/
	@DeleteMapping("/memberProductCart/{cart_num}")
	public ResponseEntity<Object> delCartByCartNum(@PathVariable int cart_num){
		return ResponseEntity.ok(service.deleteCart(cart_num));
	}
	
	/* 장바구니 항목 리스트로 검색 후 삭제 (여러개 선택시)*/
	@PostMapping("/memberProductCarts")
	public ResponseEntity<Object> delCartsByCartNums(@RequestBody List<Integer> cart_num){
		/*cart_num = "[23,43,25]"*/ 
		return ResponseEntity.ok(service.deleteCarts(cart_num));
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
		return ResponseEntity.ok(service.updateCart(cart));
	}
	
	
	/* 오류 생겼던 것들
	     장바구니 추가 하기전 검색 CartDTO cart = new CartDTO();를 만들자(매개변수로 받으면 안됌) view 만들자(productAll) */
	
	/* 장바구니 버튼 사용할경우
	 * 장바구니 내에서 회원아이디,제품 번호로 검색 있으면 update 없으면 insert를 하기위해 만든 검색문  
	 * 장바구니에서 회원아이디로 검색 한 목록 (로그인 안한경우 MemberNotLoginException예외 생성) */
	@GetMapping("/selectCartByIdAndProNum/{memberId}/{proNum}")
	public ResponseEntity<Object> selectProductByMemberIdAndProNum(@PathVariable String memberId, @PathVariable int proNum){
		
		MemberDTO member = new MemberDTO();
		member.setMemberId(memberId);
		
		ProductDTO product = new ProductDTO();
		product.setProNum(proNum);
		
		CartDTO cart = new CartDTO();
		
		cart.setMemberId(member);
		cart.setCartProNum(product);
		
		return ResponseEntity.ok(service.showCartsByMemberId(cart));
	} 
	
	/*선택된 장바구니번호를 검색후 주문페이지로 이동 memberProductOrder.jsp에 위치 */
	@PostMapping("/chooseProductCarts")
	public ResponseEntity<Object> chooseCartsByCartNums(@RequestBody List<Integer> cartNums,HttpSession session){
		/*cartNum = "[23,43,25]"*/
		// 여러개 혹은 단일
		List<CartDTO> list = service.chooseCartByMemberId(cartNums);
		session.setAttribute("cartNums", cartNums);
		return ResponseEntity.ok(list);
	}
	
	/*장바구니번호를 검색후 주문페이지로 이동 */
	@GetMapping("/chooseProductCart/{cartNum}")
	public ResponseEntity<Object> getChooseCarts(@PathVariable int cartNum){
		
		CartDTO cart = new CartDTO();
		cart.setCartNum(cartNum);
		
		List<CartDTO> list = service.showCartsByMemberId(cart);
		
		return ResponseEntity.ok(list);
	}
	
	/* 구입하기 버튼을 사용할경우
	 * (회원 아이디로 제품이 있나 검색한후 있으면 장바구니의 제품을 업데이트(수량만) 없으면 장바구니에 인서트후 구매페이지로 이동)*/
	@PostMapping("/useOrderProductBtn")
	public ResponseEntity<Object> useOrderProductBtm(@RequestBody CartDTO cartDTO){
		return ResponseEntity.ok(service.useProductOrderBtn(cartDTO));
	}
	
}

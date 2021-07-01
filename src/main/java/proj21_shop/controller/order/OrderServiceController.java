package proj21_shop.controller.order;

import java.net.BindException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
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

	private final CustomCollectionValidator customCollectionValidator = new CustomCollectionValidator();
	
	@Autowired
	private OrderService service;
	
	/* 기존 회원 정보 set 
	 * 회원 아이디를 이용해서 주문 페이지의 기존회원정보들을 세팅 
	 */ 
	@GetMapping("/existOrderMember/{memberId}")
	public ResponseEntity<Object> getCarts(@PathVariable String memberId){
		MemberDTO member = service.selectById(memberId);
		return ResponseEntity.ok(member);
	}
	
	/*주문하기 OrderServiceImpl에서 확인 가능*/
	/*1. 제품번호로 제품 정보 검색 : 할인금액, 포인트 계산*/
	/*2. 기존주소를 사용하지 않고 신규 주소를 사용한 경우 주소테이블에 따로 보관 : 주소가 있는지 없는지 검색*/
	/*3. 제품 수량이 주문 수량 보다 많거나 같을때 구입가능 : 구매가능한 경우인지 판단*/
	/*4. 각 제품 구매한 만큼 재고 감소, 총 판매 금액 증가 : 구매 성공이후 update될 제품정보*/
	/*5. 회원 update 정보 ,회원 포인트 구매시 적립될 포인트 - 사용한 포인트, 누적 사용액 증가, 누적 주문수 증가 : 구매 성공이후 update 될 회원 정보*/
	@PostMapping("/orderInfo")
	public ResponseEntity<Object> trInsertOrder(@RequestBody @Valid List<OrderDTO> orderDTO, BindingResult bindingResult) throws BindException{
		/*
		 * @Valid처리 해야 할 객체 타입이 List인 Collection이므로 제대로 처리 되지 않아서 
		 * 따로  customCollectionValidator를 만들어서 처리(List자체를 Object로 보고 리스트속 객체의 다른 항목들이 null인지 empty인지 모르는거 같다.)
		 */
		customCollectionValidator.validate(orderDTO, bindingResult);
		
		/*주문페이지에 적어야할 항목(예: 구매자 이름, 전화번호, 주소 등)이 Null이거나 Empty인 경우를 처리*/
		if(bindingResult.hasErrors()) {
			throw new BindException(bindingResult.toString());
		}
		
		System.out.println(orderDTO);
		return ResponseEntity.ok(service.trInsertOrder(orderDTO));
	}
	
	/*제품 구입 완료 후 이동하는 페이지에서 마지막 주문 번호를 검색해서 들어간다.*/
	@GetMapping("/lastOrderNum")
	public ResponseEntity<Object> getLastOrderNum(){
		return ResponseEntity.ok(service.selectLastOrderNum());
	}
	
	
}

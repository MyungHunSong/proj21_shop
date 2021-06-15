package proj21_shop.controller.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.service.order.MyOrderService;

@RestController
@RequestMapping("/api")
public class MyOrderRestController {
	@Autowired
	private MyOrderService service;

	@GetMapping("/myorder/{memberId}")
	public ResponseEntity<Object> myorder(@PathVariable String memberId) {
		return ResponseEntity.ok(service.selectOrderByMember(memberId));
	}
	
	@GetMapping("mydetailorder/{memberId}")
	public ResponseEntity<Object> myorderdetail(@PathVariable String memberId){
		return ResponseEntity.ok(service.selectOrderDetailByMember(memberId));
	}
}

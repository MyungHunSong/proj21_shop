package proj21_shop.controller.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.order.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	/*
	 * 내가 사용할 매핑주소 : /cart , view 위치와 이름 : order/memberProductCart
	 * @RequestParam(value = "memId") 설정으로 주소창에 (contextPath + /cart?memId=test01)이런식으로 표시 
	 */
	@GetMapping("/cart")
	public ModelAndView getMemberProductCart(@RequestParam(value = "memId") String memId) {
		ModelAndView mav = new ModelAndView("order/memberProductCart", "memId",memId);
		return mav;
	}
 
	/*
	 * 내가 사용할 매핑주소 : /order , view 위치와 이름 : order/memberProductOrder
	 * 처음부터 주문페이지의 mPoint를 세션에 넣어서 모두 구현 하였더니 로그인 이후에 mPoint가 
	 * 사용되어도 mPoint가 변하지 않고 처음값을 유지하는 문제가 생겼다. 그래서 세션에 이 주소로 
	 * 매핑하는 순간마다 session.putValue("mPoint", service.selectById(memId).getMemberPoint())
	 * 를 사용해서 "mPoint"란 이름에 service.selectById(memId).getMemberPoint()값 저장했다.  
	 */
	@GetMapping("/order")
	public ModelAndView orderProductCart(@RequestParam(value = "memId") String memId, HttpSession session) {
		ModelAndView mav = new ModelAndView("order/memberProductOrder", "memId",memId);
		
		session.putValue("mPoint", service.selectById(memId).getMemberPoint());
		return mav;
	} 
}
 
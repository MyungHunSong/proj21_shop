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
	
	@GetMapping("/cart")
	public ModelAndView getMemberProductCart(@RequestParam(value = "memId") String memId) {
		ModelAndView mav = new ModelAndView("order/memberProductCart", "memId",memId);
		return mav;
	}
 
	@GetMapping("/order")
	public ModelAndView orderProductCart(@RequestParam(value = "memId") String memId, HttpSession session) {
		ModelAndView mav = new ModelAndView("order/memberProductOrder", "memId",memId);
		
		session.putValue("mPoint", service.selectById(memId).getMemberPoint());
		return mav;
	} 
}
 
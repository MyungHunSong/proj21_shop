package proj21_shop.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	
	@GetMapping("/cart")
	public ModelAndView getMemberProductCart(@RequestParam(value = "memId") String memId) {
		ModelAndView mav = new ModelAndView("order/memberProductCart", "memId",memId);
		return mav;
	}
 
	@GetMapping("/order")
	public ModelAndView orderProductCart(@RequestParam(value = "memId") String memId) {
		ModelAndView mav = new ModelAndView("order/memberProductOrder", "memId",memId);
		return mav;
	} 
}

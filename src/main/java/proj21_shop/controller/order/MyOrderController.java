package proj21_shop.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyOrderController {
	@GetMapping("/myorder")
	public ModelAndView getMyOrder(@RequestParam(value="memberId") String memberId) {
		ModelAndView mav = new ModelAndView("order/myOrderList", "memberId", memberId);
		return mav;
	}
	
	@GetMapping("/detailorder")
	public ModelAndView getMyOrderDetail(@RequestParam(value="memberId") String memberId, @RequestParam(value="proNum") int proNum) {
		ModelAndView mav = new ModelAndView("order/myOrderDetail", "memberId", memberId);
		mav.addObject("proNum", proNum);
		return mav;
	}
}

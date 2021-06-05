package proj21_shop.controller.member.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class orderController {

//	public ModelAndView getProductListByProCategory(
//				@RequestParam(value = "proImgState") Integer proImgState,
//				@RequestParam(value = "proCategory") Integer proCategory
//			) {
//		ModelAndView mav = new ModelAndView("product/productList", "proImgState",proImgState);
//		mav.addObject("proCategory",proCategory);
//		return mav;
//	}
	
	@GetMapping("/cart")
	public ModelAndView getMemberProductCart(@RequestParam(value = "memId") String memId) {
		ModelAndView mav = new ModelAndView("member/order/memberProductCart", "memId",memId);
		return mav;
	}
 
}

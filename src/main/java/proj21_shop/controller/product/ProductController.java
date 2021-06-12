package proj21_shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
 
	@GetMapping("/productlist")
	public ModelAndView getProductListByProCategory(
				@RequestParam(value = "proImgState") Integer proImgState,
				@RequestParam(value = "proCategory") Integer proCategory
			) {
		ModelAndView mav = new ModelAndView("product/productList", "proImgState",proImgState);
		mav.addObject("proCategory",proCategory);
		return mav;
	}
	 
	@GetMapping("/productDetail")
	public ModelAndView getProductDetailByProNum(@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetail", "proNum",proNum);
		return mav;
	}
	
}

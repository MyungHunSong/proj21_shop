package proj21_shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
 
	@GetMapping("/productlist")
	public ModelAndView getProductListByProCategory(
				@RequestParam(value = "proCategory") Integer proCategory,
				@RequestParam(value = "section") Integer section,
				@RequestParam(value = "pageNum") Integer pageNum,
				@RequestParam(value = "priceRange") Integer priceRange,
				@RequestParam(value = "orderKind") String orderKind
			) {
		ModelAndView mav = new ModelAndView("product/productList", "proCategory",proCategory);
		mav.addObject("section",section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("priceRange",priceRange);
		mav.addObject("orderKind",orderKind);
		return mav;
	}
	 
	@GetMapping("/productDetail")
	public ModelAndView getProductDetailByProNum(@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetail", "proNum",proNum);
		return mav;
	}
	
	@GetMapping("/productDetailItem")
	public ModelAndView getProductDetailItem(
			@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetailItem" ,"proNum",proNum);
		return mav;
	}
	
	/*팝업용*/
	@GetMapping("/productDetailItem2")
	public ModelAndView getProductDetailItem2(
			@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetailItem2" ,"proNum",proNum);
		return mav;
	}
	
	@GetMapping("/productsSaleList")
	public ModelAndView productsSaleList() {
		ModelAndView mav = new ModelAndView();
		return mav;
	} 
}

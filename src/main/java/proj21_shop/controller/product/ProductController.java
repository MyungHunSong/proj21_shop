package proj21_shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
 
	/*내가 사용할 매핑주소 : /productlist , view 위치와 이름 : product/productList */
	/*@RequestParam proCategory,section,pageNum,priceRange,orderKind,search */
	@GetMapping("/productlist")
	public ModelAndView getProductListByProCategory(
				@RequestParam(value = "proCategory") Integer proCategory,
				@RequestParam(value = "section") Integer section,
				@RequestParam(value = "pageNum") Integer pageNum,
				@RequestParam(value = "priceRange") Integer priceRange,
				@RequestParam(value = "orderKind") String orderKind,
				@RequestParam(value = "search") String search
			) {
		ModelAndView mav = new ModelAndView("product/productList", "proCategory",proCategory);
		mav.addObject("section",section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("priceRange",priceRange);
		mav.addObject("orderKind",orderKind);
		mav.addObject("search",search);
		return mav;
	}
	 
	/*내가 사용할 매핑주소 : /productDetail, view 위치와 이름 : product/productDetail*/
	/*@RequestParam proNum*/
	// viewMember.jsp에 배송중 or 배송중인 상품.
	@GetMapping("/productDetail")
	public ModelAndView getProductDetailByProNum(@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetail", "proNum",proNum);
		return mav;
	}
	
	/*팝업용 : 장바구니 버튼만 표시 하기 위해 만듬*/
	@GetMapping("/productDetailItem2")
	public ModelAndView getProductDetailItem2(
			@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetailItem2" ,"proNum",proNum);
		return mav;
	}
	
}

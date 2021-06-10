package proj21_shop.controller.admin.product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.impl.admin.product.AdminProductService;

@Controller("adminProductController")
@RequestMapping("/admin/product/")
public class AdminProductController {
	
	@Autowired
	AdminProductService adminProductService;
	

	@RequestMapping("listProducts")
	public ModelAndView addNewProductMain(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/product/listProducts");
		
		return mav;
	}
	


	
	
	
}

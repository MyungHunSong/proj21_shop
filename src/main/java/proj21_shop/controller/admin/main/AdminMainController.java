package proj21_shop.controller.admin.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminMainController")
@RequestMapping("/admin/main")
public class AdminMainController {
		
	
	@GetMapping
	public ModelAndView adminMain (HttpServletRequest request, HttpServletResponse response) {
		System.out.println("git 출력");
		System.out.println("master 수정");
		ModelAndView mav=new ModelAndView("/admin/order/orderStatics");
//		mav.setViewName("/WEB-INF/view/admin/common/layout.jsp");
		return mav;
		
	}
}

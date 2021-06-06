package proj21_shop.controller.admin.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.admin.order.AdminOrderService;

@Controller("adminOrderController")
@RequestMapping("admin/order/")
public class AdminOrderController {

	@Autowired
	AdminOrderService adminOrderService;

	@RequestMapping("orderStatics")
	public ModelAndView searchMember(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> viewMap = adminOrderService.getOrderStatics();
		mav.setViewName("/admin/order/orderStatics");
		mav.addObject("viewMap", viewMap);
		System.out.println(mav);
		return mav;
	}


}
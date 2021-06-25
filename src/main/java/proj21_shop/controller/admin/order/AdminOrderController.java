package proj21_shop.controller.admin.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.admin.member.AdminMemberService;
import proj21_shop.service.admin.order.AdminOrderService;

@Controller("adminOrderController")
@RequestMapping("admin/order/")
public class AdminOrderController {
	protected static final Log log = LogFactory.getLog(AdminOrderController.class);
	@Autowired
	AdminOrderService adminOrderService;
	@Autowired
	AdminMemberService adminMemberService;

	@RequestMapping("orderStatics")
	public ModelAndView searchMember(HttpServletRequest request, HttpServletResponse response) {
		log.info("orderStatics() 진입");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> viewMap = adminOrderService.getOrderStatics();
		mav.setViewName("admin/order/orderStatics");
		mav.addObject("viewMap", viewMap);
		mav.addObject("viewMap2", adminMemberService.getMemberStatics());
		System.out.println(mav);
		return mav;
	}

	@RequestMapping("listOrders")
	public ModelAndView listOrders (HttpServletRequest request, HttpServletResponse reponse,
							@RequestParam(value="orderProNum" , required=false) String orderProNum,
							@RequestParam(value="section", required=false) String _section,
							@RequestParam(value="pageNum", required=false) String _pageNum,
							@RequestParam(value="total", required=false) String total,
							@RequestParam(value="orderMemberName", required=false) String orderMemberName,
							@RequestParam(value="deliveryStatus", required=false) String deliveryStatus,
							@RequestParam(value="orderPrice", required=false) String orderPrice,
							@RequestParam(value="change_deliveryStatus", required=false) String change_deliveryStatus,
							@RequestParam(value="change_orderProNum", required=false) String change_orderProNum
			) {
		log.info("listOrders() 진입");
		HttpSession session=request.getSession();
		if(session.getAttribute("side_menu") !=null){
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_order");
		
		ModelAndView mav=new ModelAndView();
		Map<String,Object> pagingMap=new HashMap();
		
		int section=Integer.parseInt((_section==null)? "1" : _section);
		int pageNum=Integer.parseInt((_pageNum==null)? "1" : _pageNum);
		
		//배송상태 수정하기
		if(change_deliveryStatus !=null) {
			System.out.println("change_deliveryStatus===== :"+change_deliveryStatus);
			System.out.println("change_orderProNum===== :"+change_orderProNum);
			Map<String,Object> changeMap=new HashMap();
			changeMap.put("change_deliveryStatus", change_deliveryStatus);
			changeMap.put("change_orderProNum", change_orderProNum);
			adminOrderService.changeDelivery(changeMap);
		}
		
		pagingMap.put("orderProNum", orderProNum);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("total", total);
		pagingMap.put("orderMemberName", orderMemberName);
		pagingMap.put("deliveryStatus", deliveryStatus);
		pagingMap.put("orderPrice", orderPrice);
		
		System.out.println("orderProNum :"+orderProNum);
		System.out.println("section :"+section);
		System.out.println("pageNum :"+pageNum);
		System.out.println("total :"+total);
		System.out.println("orderMemberName :"+orderMemberName);
		System.out.println("deliveryStatus :"+deliveryStatus);
		System.out.println("orderPrice :"+orderPrice);
		
		Map<String,Object> viewMap=adminOrderService.getOrderList(pagingMap);
		
		viewMap.put("orderProNum", orderProNum);
		viewMap.put("section", section);
		viewMap.put("pageNum", pageNum);
		viewMap.put("total", total);
		viewMap.put("orderMemberName", orderMemberName);
		viewMap.put("deliveryStatus", deliveryStatus);
		viewMap.put("orderPrice", orderPrice);
	
		mav.setViewName("admin/order/listOrders");
		mav.addObject("viewMap",viewMap);
		return mav;
		
		
	}
	


}
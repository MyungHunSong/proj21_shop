package proj21_shop.controller.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.admin.order.AdminOrderService;

@Controller
public class MyOrderController {
	
	@Autowired
	AdminOrderService adminOrderService;
	
	@GetMapping("/myorder")
	public ModelAndView getMyOrder(@RequestParam(value="memberId") String memberId) {
		ModelAndView mav = new ModelAndView("order/myOrderList", "memberId", memberId);
		return mav;
	}
	
	@GetMapping("/detailorder")
	public ModelAndView getMyOrderDetail(@RequestParam(value="memberId") String memberId, @RequestParam(value="orderProNum")int orderProNum) {
		ModelAndView mav = new ModelAndView("order/myOrderDetail", "memberId", memberId);
		mav.addObject("orderProNum", orderProNum);
		return mav;
	}
	
	@RequestMapping("/requestRefund")
	public ResponseEntity requestRefund(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="orderCode") String orderCode,
			@RequestParam(value="orderProNum") String orderProNum,
			@RequestParam(value="memberId") String memberId
			) {
		System.out.println("orderCode : "+orderCode);
		System.out.println("orderProNum : "+orderProNum);
		Map<String,Object> requestMap=new HashMap();
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		requestMap.put("orderProNum", Integer.parseInt(orderProNum));
		requestMap.put("orderCode", Integer.parseInt(orderCode));
		
		adminOrderService.addRefund(requestMap);
		
		String message="<script> ";
		message+=" alert('반품요청을 접수했습니다.');";
		message+=" location.href='"+request.getContextPath()+"/myorder?memberId="+memberId+"';";
		message+=" </script>";
		
		resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
		return resEnt;
		
	}
}

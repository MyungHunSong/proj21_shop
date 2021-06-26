package proj21_shop.controller.admin.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.admin.review.AdminReviewService;

@Controller("adminReviewController")
@RequestMapping("/admin/review/")
public class AdminReviewController {
	
	@Autowired
	AdminReviewService adminReviewService;

	@RequestMapping("listReviews")
	public ModelAndView listReviews(
			@RequestParam(value = "memberId", required = false) String memberId,
			@RequestParam(value = "proNum", required = false) String proNum,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_product");

		System.out.println("RequestParam==memberId :" + memberId);
		System.out.println("RequestParam==proNum :" + proNum);

		ModelAndView mav = new ModelAndView();

		Map<String, Object> pagingMap = new HashMap();
		
		Map<String, Object> reviewsMap = new HashMap();
		
		String _pageNum = (String) request.getParameter("pageNum");
		String _section = (String) request.getParameter("section");

		System.out.println("RequestParam==_section :" + _section);
		System.out.println("RequestParam==_pageNum :" + _pageNum);
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("memberId", memberId);
		pagingMap.put("proNum", proNum);

		reviewsMap = adminReviewService.listReviews(pagingMap);
		System.out.println("key : " + reviewsMap.get("listReviews"));
		reviewsMap.put("section", section);
		reviewsMap.put("pageNum", pageNum);
		reviewsMap.put("memberId", memberId);
		reviewsMap.put("proNum", proNum);

		System.out.println("reviewsMap :section=" + section);
		System.out.println("reviewsMap :pageNum=" + pageNum);
		System.out.println("reviewsMap :memberId=" + memberId);
		System.out.println("reviewsMap :proNum=" + proNum);

		mav.addObject("reviewsMap", reviewsMap);
		System.out.println("key : " + reviewsMap.get("section"));
		mav.setViewName("admin/review/listReviews");

		return mav;
	}
}

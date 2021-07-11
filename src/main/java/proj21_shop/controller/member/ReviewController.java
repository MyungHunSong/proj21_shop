package proj21_shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	/* 리뷰 작성 페이지로 이동 */
	@GetMapping
	public String Review(HttpSession session) {
		return "/review/reviewForm";
	}
}

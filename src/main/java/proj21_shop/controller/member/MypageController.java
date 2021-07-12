package proj21_shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	/* 마이 페이지로 이동 */
	@GetMapping
	public String mypage(HttpSession session) {
		return "/member/mypage/mypage";
	}
}

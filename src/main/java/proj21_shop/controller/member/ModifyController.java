package proj21_shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/modify")
public class ModifyController {
	
	@GetMapping
	public String modify(HttpSession session) {
		return "/member/register/modifyForm";
	}
}

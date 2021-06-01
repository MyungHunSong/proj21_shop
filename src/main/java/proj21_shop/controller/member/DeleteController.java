package proj21_shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/delete")
public class DeleteController {
	
	@GetMapping
	public String delete(HttpSession session) {
		return "/member/delete/deleteForm";
	}
}

package proj21_shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_shop.dto.member.AuthInfo;
import proj21_shop.dto.member.DeleteRequest;
import proj21_shop.exception.MemberNotFoundException;
import proj21_shop.service.MemberDeleteService;

@Controller
@RequestMapping("/delete")
public class DeleteController {

	@Autowired
	private MemberDeleteService memberDeleteService;

	@GetMapping
	public String delete(@ModelAttribute("DeleteRequest") DeleteRequest req) {
		return "/member/delete/deleteForm";
	}

	@PostMapping
	public String Delete(@ModelAttribute("DeleteRequest") DeleteRequest req, Errors errors, HttpSession session) {
		System.out.println("aaa");
		if (errors.hasErrors()) {
			return "/member/delete/deleteForm";
		}
		try {
			System.out.println("aaaaa");
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			memberDeleteService.delete(authInfo.getId(), req);
		} catch (MemberNotFoundException e) {
			return "/member/delete/deleteForm";
		}
		return "/member/delete/deleteSuccess";
	}
}

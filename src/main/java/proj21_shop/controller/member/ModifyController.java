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
import proj21_shop.dto.member.ModifyRequest;
import proj21_shop.exception.MemberNotFoundException;
import proj21_shop.service.MemberModifyService;

@Controller
@RequestMapping("/modify")
public class ModifyController {

	@Autowired
	private MemberModifyService memberModifyService;

	@GetMapping
	public String modify(@ModelAttribute("ModifyRequest") ModifyRequest modifyRequest) {
		return "/member/register/modifyForm";
	}

	@PostMapping
	public String Modify(@ModelAttribute("ModifyRequest") ModifyRequest modifyRequest, Errors errors,
			HttpSession session) {
		if (errors.hasErrors()) {
			return "/member/register/modifyForm";
		}
		try{AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		memberModifyService.modify(authInfo.getId(), modifyRequest);
		}catch (MemberNotFoundException e) {
			return "/member/register/modifyForm";
		}
		
		return "/member/register/modifySuccess";

	}
}

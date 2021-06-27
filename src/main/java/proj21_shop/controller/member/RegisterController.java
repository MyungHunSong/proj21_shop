package proj21_shop.controller.member;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_shop.dto.member.RegisterRequest;
import proj21_shop.exception.DuplicateMemberException;
import proj21_shop.service.MemberRegisterService;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private MemberRegisterService memberRegisterService;
	
	@GetMapping
	public String register(Model model) {
		model.addAttribute("RegisterRequest", new RegisterRequest());
		return "member/register/registerForm";
	}
	
	@PostMapping
	public String Register(@ModelAttribute("RegisterRequest") RegisterRequest regReq, Errors errors, Model model, HttpServletResponse response) throws IOException {
		if(errors.hasErrors())
			return "member/register/registerForm";
		try {
			memberRegisterService.regist(regReq);
			return "member/register/registerSuccess";
		}catch(DuplicateMemberException ex) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 존재하는 회원입니다.'); history.go(-1);</script>");
			out.flush();
			return "member/register/registerForm";
		}
	}
	

}

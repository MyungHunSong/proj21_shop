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
import proj21_shop.exception.PasswordNotEqualException;
import proj21_shop.service.MemberRegisterService;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private MemberRegisterService memberRegisterService;
	
	/* 회원 가입 페이지로 이동 */
	@GetMapping
	public String register(Model model) {
		model.addAttribute("RegisterRequest", new RegisterRequest());
		return "member/register/registerForm";
	}
	
	/* 회원 가입 */
	@PostMapping
	public String Register(@ModelAttribute("RegisterRequest") RegisterRequest regReq, Errors errors, Model model, HttpServletResponse response) throws IOException {
		if(errors.hasErrors())
			return "member/register/registerForm";
		try {
			memberRegisterService.regist(regReq);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('환영합니다. 포인트 2000p 증정 되었습니다.'); window.location.href='main';</script>");
			out.flush();
			return "member/register/registerSuccess";
		}catch(DuplicateMemberException ex) {
			response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>");
        	out.println("<script>$(function() {$('.unMatch').text('아이디 중복');})</script>");
        	out.flush();
			return "member/register/registerForm";
		}catch (PasswordNotEqualException e) {
			response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>");
        	out.println("<script>$(function() {$('.disMatch').text('비밀번호 불일치');})</script>");
        	out.flush();
        	return "member/register/registerForm";
		}
	}
	

}

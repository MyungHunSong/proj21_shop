package proj21_shop.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
import proj21_shop.exception.PasswordNotEqualException;
import proj21_shop.exception.QuestionAnswerNotEqualException;
import proj21_shop.exception.QuestionNotEqualException;
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
			HttpSession session, HttpServletResponse response) throws IOException {
		if (errors.hasErrors()) {
			return "/member/register/modifyForm";
		}
		try{AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			memberModifyService.modify(authInfo.getId(), modifyRequest);
		}catch (QuestionNotEqualException e) {
			response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>");
        	out.println("<script>$(function() {$('.disMatch').text('질문불일치');})</script>");
        	out.flush();
			return "/member/register/modifyForm";
		}catch (QuestionAnswerNotEqualException e) {
			response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>");
        	out.println("<script>$(function() {$('.unMatch').text('답변 불일치');})</script>");
        	out.flush();
			return "/member/register/modifyForm";
		}
		response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	out.println("<script>alert('회원 정보 수정이 완료되었습니다');  window.location.href='main';</script>");
    	out.flush();
		return "/main/main";

	}
}

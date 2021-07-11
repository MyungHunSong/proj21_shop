package proj21_shop.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
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
import proj21_shop.dto.member.MemberDTO;
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

	/* 회원 정보 수정하는 페이지로 이동 */
	@GetMapping
	public String modify(@ModelAttribute("ModifyRequest") ModifyRequest modifyRequest, HttpSession session,HttpServletRequest request) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");	//세션에서 로그인 한 회원의 정보를 가져오기
			MemberDTO member = memberModifyService.form(authInfo.getId());
			request.setAttribute("memberPh", member.getMemberPh());	//회원의 원래 정보 세팅
			request.setAttribute("memberEmail", member.getMemberEmail());
			request.setAttribute("memberAddr1", member.getMemberAddr1());
			request.setAttribute("memberAddr2", member.getMemberAddr2());
			request.setAttribute("memberAddr3", member.getMemberAddr3());
			return "/member/register/modifyForm";
	}
	
	/* 회원 정보 수정 */
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

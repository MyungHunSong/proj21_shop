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
import proj21_shop.dto.member.DeleteRequest;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.exception.PasswordNotEqualException;
import proj21_shop.exception.WrongIdPasswordException;
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
	public String Delete(@ModelAttribute("DeleteRequest") DeleteRequest req, Errors errors, HttpSession session, HttpServletResponse response) throws IOException {
		if (errors.hasErrors()) {
			return "/member/delete/deleteForm";
		}
		try {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			MemberDTO member = new MemberDTO();
			member.setMemberId(authInfo.getId());
			member.setMemberPwd(req.getPassword());
			MemberDTO newmember = memberDeleteService.select(member, req);
			
			if(newmember==null) {
				throw new PasswordNotEqualException();
			}
			
			if(!req.getPassConfirm().equals(req.getPassword())) {
				throw new PasswordNotEqualException();
			}
			
			memberDeleteService.delete(newmember);
			
			
		} catch (PasswordNotEqualException e) {
			response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>");
        	out.println("<script>$(function() {$('.disMatch').text('비밀번호 불일치');})</script>");
        	out.flush();
			return "/member/delete/deleteForm";
		}
		response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	out.println("<script>alert('그동안 이용해주셔서 감사합니다.');  window.location.href='logout';</script>");
    	out.flush();
		return "/main/main";
	}
}

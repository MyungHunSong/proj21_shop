package proj21_shop.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_shop.dto.member.AuthInfo;
import proj21_shop.dto.member.LoginCommand;
import proj21_shop.exception.WrongIdPasswordException;
import proj21_shop.service.AuthService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
    private AuthService authService;

    @GetMapping
    public String form(LoginCommand loginCommand, @CookieValue(value="REMEMBER", required = false) Cookie rCookie) {
    	if (rCookie != null) {
            loginCommand.setId(rCookie.getValue());
            loginCommand.setRememberId(true);
        }
        return "/member/login/loginForm";
    }

    @PostMapping
    public String submit(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) throws IOException {

        if (errors.hasErrors())
            return "/member/login/loginForm";

        try {
            AuthInfo authInfo = authService.authenicate(loginCommand.getId(), loginCommand.getPassword());
            session.setAttribute("authInfo", authInfo);
			/*
			 * Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
			 * rememberCookie.setPath("/"); if (loginCommand.isRememberId()) {
			 * rememberCookie.setMaxAge(60 * 60 * 24 * 30); }else {
			 * rememberCookie.setMaxAge(0); } response.addCookie(rememberCookie);
			 */
            if(loginCommand.getId().equals("admin")) {
            	
            	return "redirect:/admin/order/orderStatics";
            }
      			  
            return "redirect:/main";

        }catch (WrongIdPasswordException ex) {
        	response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
        	out.flush();
            return "/member/login/loginForm";
        }
    }
}

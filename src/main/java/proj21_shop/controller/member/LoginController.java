package proj21_shop.controller.member;

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
import proj21_shop.dto.member.exception.WrongIdPasswordException;
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
    public String submit(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) {
        if (errors.hasErrors()) {
        	return "/login/loginForm";
        }
        try {
        	
        	System.out.println(loginCommand.getPassword());
            AuthInfo authInfo = authService.authenicate(loginCommand.getId(), loginCommand.getPassword());
            System.out.println(authInfo);
            session.setAttribute("authInfo", authInfo);
            
            Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
            rememberCookie.setPath("/");
            if (loginCommand.isRememberId()) {
                rememberCookie.setMaxAge(60 * 60 * 24 * 30);
            }else {
                rememberCookie.setMaxAge(0);
            }
            response.addCookie(rememberCookie);

            return "/member/login/loginSuccess";
        }catch (WrongIdPasswordException ex) {
        	System.out.println(11111);
            errors.reject("idPasswordNotMatching");
            return "/member/login/loginForm";
        }
    }
}

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

	/* 로그인 페이지로 이동 */
    @GetMapping
	public String form(LoginCommand loginCommand) {
        return "/member/login/loginForm";
    }
    
    // HttpSession 을 사용해서 로그인 정보를 유지 시켰다. (다른 jsp 페이지 에서도 활용가능하다)
    @PostMapping
    public String submit(LoginCommand loginCommand, Errors errors, HttpSession session, HttpServletResponse response) throws IOException {

        if (errors.hasErrors())
            return "/member/login/loginForm";

        try {
            AuthInfo authInfo = authService.authenicate(loginCommand.getId(), loginCommand.getPassword());//폼에 입력한 아이디와 비밀번호와 일치하는 회원이 있는지 확인
            session.setAttribute("authInfo", authInfo);//세션에 로그인 정보 저장
            
            System.out.println("LoginController >>> "+authInfo);
            System.out.println("loginCommand.password >>> " + loginCommand.getPassword());
   
            if(loginCommand.getId().equals("admin")) { 	
            	return "redirect:/admin/order/orderStatics"; // 관리자일시 관리자 view페이지로 보내주는 역할을 한다.
            }
            return "redirect:/main";

        }catch (WrongIdPasswordException ex) {
        	response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	
        	// 여기에 그걸 담아보면 어떨까? 아이디는 맞고 비번은 틀렸다? 비밀번호가 일치하지 않습니다 => 아이디창에 아이디는 그대로 나두고 비밀번호는 새로 치도록
        	// 실제 저장된 비밀번호 값 loginCommand.getPassword() 내가 html 내에서 로그인한 password값 일치 => 로그인 불일치 => 아이디 혹 비밀번호가 일치하지 않습니다.
        	out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
        	out.flush();
            return "/member/login/loginForm";
        }
    }
}

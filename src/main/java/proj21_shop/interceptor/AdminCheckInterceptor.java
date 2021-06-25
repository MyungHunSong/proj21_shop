package proj21_shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import proj21_shop.dto.member.AuthInfo;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {

		HttpSession session = req.getSession();
		System.out.println("session>>>>>>>>>>" + session.getAttributeNames());

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		System.out.println("authInfo>>>>>>>>>>" + authInfo);
		if (authInfo == null || !authInfo.getId().equals("admin")) {
			System.out.println("메인으로 가면 이게 나옵니다.");
			System.out.println("authInfo null");
			res.sendRedirect(req.getContextPath() + "/main");
			return false;
		} else if (authInfo.getId().equals("admin")) {
			System.out.println("authInfo에서 아이디가 admin이랑 같으면 이게 나옵니다.");
			return true;
		}
		return false;
	}
}
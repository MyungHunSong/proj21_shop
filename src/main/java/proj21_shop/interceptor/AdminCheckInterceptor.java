package proj21_shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import proj21_shop.dto.member.AuthInfo;
import proj21_shop.dto.member.MemberDTO;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {

		HttpSession session = req.getSession();
		if (session != null) {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			
			if (authInfo == null || authInfo.getId().equals("admin")) {
				return true;
			}
		}
		res.sendRedirect(req.getContextPath() + "/main");
		return false;
	}
}
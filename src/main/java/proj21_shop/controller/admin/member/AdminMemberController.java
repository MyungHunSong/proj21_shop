package proj21_shop.controller.admin.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.admin.member.AdminMemberService;

@Controller("adminMemberController")
@RequestMapping("/admin/member/")
public class AdminMemberController {
	@Autowired
	AdminMemberService adminMemberService;
	
	@RequestMapping("listMembers")
	public ModelAndView searchMember(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/member/listMembers");
		System.out.println(mav);
		return mav;
	}
}

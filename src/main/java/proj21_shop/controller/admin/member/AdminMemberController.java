package proj21_shop.controller.admin.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_shop.service.admin.member.AdminMemberService;

@Controller("adminMemberController")
@RequestMapping("/admin/member/")
public class AdminMemberController {
	@Autowired
	AdminMemberService adminMemberService;

	@RequestMapping("listMembers") // 회원목록 리스트로 뽑아내기
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "memberTotalBuy", required = false) String memberTotalBuy,
			@RequestParam(value = "memberTotalOrder", required = false) String memberTotalOrder,
			@RequestParam(value = "memberGender", required = false) String memberGender,
			@RequestParam(value = "keyword", required = false) String keyword) {

		HttpSession session = request.getSession();
		if (session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		ModelAndView mav = new ModelAndView();
//		String _section = (String) request.getParameter("section"); // 섹션값가져오기
//		String _pageNum = (String) request.getParameter("pageNum"); // 페이지넘버가져오기

//		int section = Integer.parseInt(((_section == null) ? "1" : _section)); // int로 변환
//		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));

		Map<String, Object> pagingMap = new HashMap<String, Object>();

		session.setAttribute("side_menu", "side_member");
		session.setAttribute("width", "600");
//		
//		System.out.println("section : " + section);
//		System.out.println("pageNum : " + pageNum);
		System.out.println("memberTotalBuy : " + memberTotalBuy);
		System.out.println("memberTotalOrder : " + memberTotalOrder);
		System.out.println("memberGender : " + memberGender);
		System.out.println("keyword : " + keyword);

		pagingMap.put("memberTotalBuy", memberTotalBuy);
		pagingMap.put("memberTotalOrder", memberTotalOrder);
		pagingMap.put("memberGender", memberGender);
		pagingMap.put("keyword", keyword);

		// 최종으로 jsp에 보내줄 Map생성 이쪽에 membersList 그리고 Paging,section번호까지 담아서 보내줄거임
		Map<String, Object> membersMap = adminMemberService.listMembers(pagingMap);
		System.out.println("key : " + membersMap.get("membersList"));
//		membersMap.put("section", section);
//		membersMap.put("pageNum", pageNum);
		System.out.println("memberTotalBuy2 : " + memberTotalBuy);
		System.out.println("memberTotalOrder2 : " + memberTotalOrder);
		System.out.println("memberGender2 : " + memberGender);
		System.out.println("keyword2 : " + keyword);
		membersMap.put("memberTotalBuy", memberTotalBuy);
		membersMap.put("memberTotalOrder", memberTotalOrder);
		membersMap.put("memberGender", memberGender);
		membersMap.put("keyword", keyword);
		mav.addObject("membersMap", membersMap); // 회원정보를 담은 membersMap를 바인딩
		mav.setViewName("admin/member/listMembers");
		System.out.println("mav" + mav);

		return mav;
	}

	@RequestMapping("viewMember")
	public ModelAndView viewMember(@RequestParam(value = "memberId", required = false) String memberId,
			@RequestParam(value = "memberKeyword", required = false) String memberKeyword, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_member");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map searchMap = new HashMap();
		Map<String, Object> viewMap = new HashMap();

		if (memberId != null && !memberId.equals("")) {
			searchMap.put("memberId", memberId);
			System.out.println("memberId : " + memberId);
		}
		if(memberKeyword == null) {
			memberKeyword="test011";
		}
		if (memberKeyword != null && !memberKeyword.equals("")) {
			searchMap.put("memberKeyword", memberKeyword);
			System.out.println("memberKeyword " + memberKeyword);
		}

		viewMap = adminMemberService.viewMember(searchMap);
		mav.setViewName("admin/member/viewMember");

		mav.addObject("viewMap", viewMap);
		return mav;
	}

	@RequestMapping("deleteMember")
	public ModelAndView deleteMember(@RequestParam(value = "memberId", required = false) String memberId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		ModelAndView mav = new ModelAndView();

		adminMemberService.deleteMember(memberId);

		mav.setViewName("redirect:admin/member/listMembers");
		return mav;
	}

	@RequestMapping(value = "searchMember", method = { RequestMethod.POST })
	public ModelAndView searchMember(@RequestParam(value = "memberSearch", required = false) String memberSearch, RedirectAttributes redir,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		redir.addAttribute("memberKeyword", memberSearch);
		mav.setViewName("redirect:admin/member/viewMember");
		return mav;

	}
	
	@RequestMapping("memberStatics")
	public ModelAndView searchMember (HttpServletRequest request, HttpServletResponse response) {
		
		
	ModelAndView mav=new ModelAndView();

	
	Map<String,Object> viewMap=adminMemberService.getMemberStatics();
	
	mav.addObject("viewMap",viewMap);
	mav.setViewName("admin/member/memberStatics");
	return mav;		
	
}
}

package proj21_shop.service.impl.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.mapper.admin.member.AdminMemberMapper;
import proj21_shop.service.admin.member.AdminMemberService;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	AdminMemberMapper adminMemberMapper;

	@Override
	public Map<String, Object> listMembers(Map<String, Object> pagingMap) {

		Map<String, Object> membersMap = new HashMap<String, Object>();

		int allMen, allWomen, totMembers, selectedMembers = 0;
		List<MemberDTO> membersList = null;
		// 남자회원수 가져오기
		allMen = adminMemberMapper.selectAllMemberMen();
		// 여자회원수 가져오기
		allWomen = adminMemberMapper.selectAllMemberWomen();
		// 총 회원수
		totMembers = adminMemberMapper.selectTotalMembers();
		// MemberList가져옴
		membersList = adminMemberMapper.selectAllMembersList(pagingMap); 
		// MemberList가져온 사람 수
		selectedMembers = adminMemberMapper.selectedMembers(pagingMap);
		
		
		System.out.println("======allMen : " + allMen);
		System.out.println("======allWomen : " + allWomen);
		System.out.println("======totMembers : " + totMembers);
		System.out.println("======membersList : " + membersList);
		System.out.println("======selectedMembers : " + selectedMembers);
		membersMap.put("membersList", membersList);
		membersMap.put("totMembers", totMembers);
		membersMap.put("allMen", allMen);
		membersMap.put("allWomen", allWomen);
		membersMap.put("selectedMembers", selectedMembers);
		return membersMap;
	}
}

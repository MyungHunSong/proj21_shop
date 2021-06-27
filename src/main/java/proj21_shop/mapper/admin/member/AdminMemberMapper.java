package proj21_shop.mapper.admin.member;

import java.util.List;
import java.util.Map;

import proj21_shop.dto.member.MemberDTO;

public interface AdminMemberMapper {
	
	/*
	 * void deleteMember(String memberId);
	 * 
	 * MemberDTO selectMemberByCertain(Map searchMap);
	 */

	List<MemberDTO> selectAllMembersList(Map<String, Object> pagingMap);//
	
	int selectTotalMembers();//

	int selectAllMemberMen();//

	int selectAllMemberWomen();//

	int selectedMembers(Map<String, Object> pagingMap);//
	
	int deleteMember(String memberId);

	MemberDTO selectMemberByCertain(Map<String, Object> searchMap);
	
	int updateMember(Map<String, Object> changeMap);
}

package proj21_shop.service.admin.member;

import java.util.Map;

public interface AdminMemberService {

	Map<String, Object> listMembers(Map<String, Object> pagingMap);

	void deleteMember(String memberId);

	Map<String, Object> viewMember(Map searchMap);
//
//	Map<String, Object> getMemberStatics();

}
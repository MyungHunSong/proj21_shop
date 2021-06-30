package proj21_shop.service.admin.member;

import java.util.Map;

public interface AdminMemberService {
	//모든 member 뽑아오기
	Map<String, Object> listMembers(Map<String, Object> pagingMap);

	//member 삭제
	void deleteMember(String memberId);

	//member 상세 정보
	Map<String, Object> viewMember(Map searchMap);

	//차트에 사용할 정보
	Map<String, Object> getMemberStatics();
	
	//반품했을 시 수정되는 정보들..
	int changeMember(Map<String, Object> changeMap);

}
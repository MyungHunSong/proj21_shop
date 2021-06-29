package proj21_shop.mapper.member;

import java.util.List;

import org.springframework.stereotype.Component;


import proj21_shop.dto.member.MemberDTO;

public interface MemberMapper {

	List<MemberDTO> selectAll();
	
	MemberDTO selectByLoginId(MemberDTO member);

	MemberDTO selectById(String id);
	
	MemberDTO selectMemberById(String id);
	
	int insertMember(MemberDTO member);
	
	int updateMember(MemberDTO member);
	
	int deleteMember(MemberDTO member);
	
	int updateTotalLogin(MemberDTO member);


}

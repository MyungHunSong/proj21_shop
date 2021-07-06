package proj21_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.DeleteRequest;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.exception.MemberNotFoundException;
import proj21_shop.exception.PasswordNotEqualException;
import proj21_shop.mapper.member.MemberMapper;

@Service
public class MemberDeleteService {
	@Autowired
	private MemberMapper mapper;
	
	public MemberDTO select(MemberDTO member, DeleteRequest req) {
		MemberDTO newMember = mapper.selectByIdPwd(member);
		member.setMemberPwd(req.getPassword());
		return newMember;
	}

	public void delete(MemberDTO newMember) {
		mapper.deleteMember(newMember);
	}
}

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

	public void delete(String id, DeleteRequest req) {
		MemberDTO member = mapper.selectById(id);
		if (member.getMemberPwd().equals(req.getPassword()) && req.getPassConfirm().equals(req.getPassword())) {
			member = new MemberDTO(id, 0);
			mapper.deleteMember(member);
		} else {
			throw new PasswordNotEqualException();
		}
	}
}

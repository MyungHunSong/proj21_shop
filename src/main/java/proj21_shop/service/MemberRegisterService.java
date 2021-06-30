package proj21_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.member.RegisterRequest;
import proj21_shop.exception.DuplicateMemberException;
import proj21_shop.exception.PasswordNotEqualException;
import proj21_shop.mapper.member.MemberMapper;

@Service
public class MemberRegisterService {

	@Autowired
	private MemberMapper mapper;

	public String regist(RegisterRequest req)  {
		MemberDTO member = mapper.selectById(req.getMemberId());

		if (member != null) {
			throw new DuplicateMemberException("dup id"+req.getMemberId());
		}
		
		if(!req.getMemberPwdConfirm().equals(req.getMemberPwd())) {
			throw new PasswordNotEqualException();
		}

		MemberDTO newMember = new MemberDTO(req.getMemberId(), req.getMemberPwd(), req.getMemberName(),
				req.getMemberPh(), req.getMemberBirth(), req.getMemberGender(), req.getMemberPwdQ(),
				req.getMemberPwdA(), req.getMemberAddr1(), req.getMemberAddr2(), req.getMemberAddr3(),
				req.getMemberEmail());
		mapper.insertMember(newMember);
		return newMember.getMemberId();
	}

}

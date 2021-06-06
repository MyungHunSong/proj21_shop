package proj21_shop.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.member.RegisterRequest;
import proj21_shop.exception.DuplicateMemberException;
import proj21_shop.mapper.member.MemberMapper;

@Service
public class MemberRegisterService {

	@Autowired
	private MemberMapper memberMapper;

	public String regist(RegisterRequest req)  {
		MemberDTO member = memberMapper.selectById(req.getMemberId());

		if (member != null) {
			throw new DuplicateMemberException("dup id"+req.getMemberId());
		}

		MemberDTO newMember = new MemberDTO(req.getMemberId(), req.getMemberPwd(), req.getMemberName(),
				req.getMemberPh(), req.getMemberBirth(), req.getMemberGender(), req.getMemberPwdQ(),
				req.getMemberPwdA(), req.getMemberAddr1(), req.getMemberAddr2(), req.getMemberAddr3(),
				req.getMemberEmail());
		memberMapper.insertMember(newMember);
		return newMember.getMemberId();
	}

}

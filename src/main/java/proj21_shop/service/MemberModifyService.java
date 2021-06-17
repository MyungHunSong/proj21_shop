package proj21_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.member.ModifyRequest;
import proj21_shop.exception.MemberNotFoundException;
import proj21_shop.exception.QuestionAnswerNotEqualException;
import proj21_shop.exception.QuestionNotEqualException;
import proj21_shop.mapper.member.MemberMapper;

@Service
public class MemberModifyService {
	@Autowired
	private MemberMapper mapper;

	public void modify(String id, ModifyRequest req) {
		MemberDTO member = mapper.selectById(id);
		if (member.getMemberPwdQ() != req.getMemberPwdQ())
			throw new QuestionNotEqualException();
		if (member.getMemberPwdQ().equals(req.getMemberPwdQ()) && member.getMemberPwdA().equals(req.getMemberPwdA())) {
			member = new MemberDTO(id, req.getMemberPh(), req.getMemberAddr1(), req.getMemberAddr2(),
					req.getMemberAddr3(), req.getMemberEmail());
			mapper.updateMember(member);
		} else {
			throw new QuestionAnswerNotEqualException();
		}
	}
}

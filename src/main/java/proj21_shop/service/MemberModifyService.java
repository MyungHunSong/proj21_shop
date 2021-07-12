package proj21_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.member.ModifyRequest;
import proj21_shop.exception.QuestionAnswerNotEqualException;
import proj21_shop.exception.QuestionNotEqualException;
import proj21_shop.mapper.member.MemberMapper;

@Service
public class MemberModifyService {
	@Autowired
	private MemberMapper mapper;
	
	/* 아이디로 회원 검색 */
	public MemberDTO form(String id) {
		MemberDTO member = mapper.selectMemberById(id);
		return member;
	}
	
	/* 회원 정보 수정 */
	public void modify(String id, ModifyRequest req) {
		MemberDTO member = mapper.selectById(id);	//아이디로 회원 검색

		if (!member.getMemberPwdQ().equals(req.getMemberPwdQ())) {	//폼에 입력한 비밀번호 확인 질문과 회원의 비밀번호 확인 질문이 일치하지 않으면 예외 던져주기
			throw new QuestionNotEqualException();
		}

		if (!member.getMemberPwdA().equals(req.getMemberPwdA())) {	//폼에 입력한 비밀번호 확인 대답과 회원의 비밀번호 확인 대답이 일치하지 않으면 예외 던져주기
			throw new QuestionAnswerNotEqualException();
		}

		member = new MemberDTO(id, req.getMemberPh(), req.getMemberAddr1(), req.getMemberAddr2(), req.getMemberAddr3(),
				req.getMemberEmail());	//폼에 입력한 정보로 회원 객체 생성
		mapper.updateMember(member);	//회원 정보 수정

	}

}

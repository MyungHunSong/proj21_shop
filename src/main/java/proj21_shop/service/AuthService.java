package proj21_shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.AuthInfo;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.exception.WrongIdPasswordException;
import proj21_shop.mapper.member.MemberMapper;

@Service
public class AuthService {

	@Autowired
	private MemberMapper mapper;
	 
	public AuthInfo authenicate(String id, String password) {
		MemberDTO member = new MemberDTO();
		member.setMemberId(id);
		member.setMemberPwd(password);
		MemberDTO newmember = mapper.selectByLoginId(member);	//폼에 입력한 아이디와 비밀번호가 일치하는 회원을 검색
		
		if(newmember==null) {
			throw new WrongIdPasswordException();	//일치하는 회원이 없다면 예외 던져주기
		}
		
		AuthInfo au =  new AuthInfo(newmember.getMemberId(), newmember.getMemberEmail(), newmember.getMemberName());
		mapper.updateTotalLogin(newmember); //로그인 시 로그인 수 증가
		au.setmPoint(newmember.getMemberPoint());
		System.out.println(au);
		return au;
	}
}

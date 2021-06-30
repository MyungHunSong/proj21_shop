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
		MemberDTO newmember = mapper.selectByLoginId(member);
		
		if(newmember==null) {
			throw new WrongIdPasswordException();
		}
		
		AuthInfo au =  new AuthInfo(newmember.getMemberId(), newmember.getMemberEmail(), newmember.getMemberName());
		mapper.updateTotalLogin(newmember); //로그인 시 로그인 수 증가
		au.setmPoint(newmember.getMemberPoint());
		System.out.println(au);
		return au;
	}
}

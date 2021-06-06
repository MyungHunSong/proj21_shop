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
		MemberDTO member = mapper.selectById(id);
		if(member==null) {
			throw new WrongIdPasswordException();
		}
		if(!member.matchPassword(password)) {
			throw new WrongIdPasswordException();
		}
		AuthInfo au =  new AuthInfo(member.getMemberId(), member.getMemberEmail(), member.getMemberName());
		au.setmPoint(member.getMemberPoint());
		return au;
	}
}

package proj21_shop.service.impl.admin.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.mapper.admin.order.AdminOrderMapper;
import proj21_shop.service.admin.member.AdminMemberService;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	AdminOrderMapper adminMemberMapper;

	@Override
	public Map<String, Object> listMembers(Map<String, Object> pagingMap) {
		// TODO Auto-generated method stub
		return null;
	}
}

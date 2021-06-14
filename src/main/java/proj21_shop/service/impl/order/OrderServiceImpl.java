package proj21_shop.service.impl.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.mapper.member.MemberMapper;
import proj21_shop.service.order.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public MemberMapper mapper;
	
	@Override
	public MemberDTO selectById(String id) {
		return mapper.selectById(id);
	}

}

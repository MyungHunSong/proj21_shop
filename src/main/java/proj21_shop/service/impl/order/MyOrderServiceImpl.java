package proj21_shop.service.impl.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.order.OrderDTO;
import proj21_shop.mapper.order.MyOrderListMapper;
import proj21_shop.service.order.MyOrderService;

@Service
public class MyOrderServiceImpl implements MyOrderService {

	@Autowired
	private MyOrderListMapper mapper;
	
	@Override
	public List<OrderDTO> selectOrderByMember(String memberId) {
		return mapper.selectOrderByMember(memberId);
	}

}

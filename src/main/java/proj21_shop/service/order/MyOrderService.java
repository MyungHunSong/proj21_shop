package proj21_shop.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.order.OrderDTO;

@Service
public interface MyOrderService {
	List<OrderDTO> selectOrderByMember(String memberId);
	List<OrderDTO> selectOrderDetailByMember(OrderDTO orderDTO);
}

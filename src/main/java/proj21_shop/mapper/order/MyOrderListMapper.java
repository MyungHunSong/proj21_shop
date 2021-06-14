package proj21_shop.mapper.order;

import java.util.List;

import proj21_shop.dto.order.OrderDTO;

public interface MyOrderListMapper {

	List<OrderDTO> selectOrderByMember(String memberId);
}

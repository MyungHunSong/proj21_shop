package proj21_shop.service.admin.order;

import java.util.Map;

public interface AdminOrderService {
	Map<String, Object> getOrderStatics();
	
	Map<String, Object> getOrderList(Map<String, Object> pagingMap);
	
	int changeDelivery(Map<String, Object> changeMap);

	void addRefund(Map<String, Object> requestMap);
}

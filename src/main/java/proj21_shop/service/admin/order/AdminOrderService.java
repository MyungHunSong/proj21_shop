package proj21_shop.service.admin.order;

import java.util.Map;

public interface AdminOrderService {
	Map<String, Object> getOrderStatics();
	
	Map<String, Object> getOrderList(Map<String, Object> pagingMap);
	
	void changeDelivery(String change_delivery_status, String change_detail_code);

	void addRefund(Map<String, Object> requestMap);
}

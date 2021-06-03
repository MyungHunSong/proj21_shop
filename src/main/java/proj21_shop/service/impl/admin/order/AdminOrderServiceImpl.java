package proj21_shop.service.impl.admin.order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.mapper.admin.order.AdminOrderMapper;
import proj21_shop.service.admin.order.AdminOrderService;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	AdminOrderMapper adminOrderMapper;

	@Override
	public Map<String, Object> getOrderStatics() {

		Map<String, Object> viewMap = new HashMap<String, Object>();
		// 총 수익
		int totalRevenue = 0;
		// 주문수
		int totalOrderCount = 0;
		// 총 제품 주문수
		int totOrders = 0;
		// 환불 완료수
		int totDoneRefundDelivery = 0;

		String orderExist = adminOrderMapper.atLeastOneOrder();

		// 오더존재 = true이면
		if (orderExist.equals("true")) {
			totalRevenue = adminOrderMapper.getTotalRevenue();
			totalOrderCount = adminOrderMapper.getTotalOrderCount();
			totOrders = adminOrderMapper.selectTotalOrders();
			totDoneRefundDelivery = adminOrderMapper.selectAllDoneRefund();
		}

		viewMap.put("totalRevenue", totalRevenue);
		viewMap.put("totalOrderCount", totalOrderCount);
		viewMap.put("totOrders", totOrders);
		viewMap.put("totDoneRefundDelivery", totDoneRefundDelivery);

		return viewMap;
	}

}

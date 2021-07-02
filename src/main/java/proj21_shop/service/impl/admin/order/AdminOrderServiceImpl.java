package proj21_shop.service.impl.admin.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_shop.dto.order.OrderDTO;
import proj21_shop.mapper.admin.member.AdminMemberMapper;
import proj21_shop.mapper.admin.order.AdminOrderMapper;
import proj21_shop.mapper.admin.product.AdminProductMapper;
import proj21_shop.service.admin.order.AdminOrderService;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	AdminOrderMapper adminOrderMapper;
	@Autowired
	AdminMemberMapper adminMemberMapper;
	@Autowired
	AdminProductMapper adminProductMapper;

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
	
	@Override
	public Map<String, Object> getOrderList(Map<String, Object> pagingMap) {
	Map<String,Object> viewMap=new HashMap();
	
		int totOrders,totOnDelivery,totDoneDelivery,selectedTotal,totWaitingRefundDelivery,totDoneRefundDelivery,totWaitingDelivery=0;
		
		//orderList 가져오기
		List<OrderDTO> orderList=adminOrderMapper.selectOrderList(pagingMap); 
		totOrders=adminOrderMapper.selectTotalOrders();
		totOnDelivery=adminOrderMapper.selectAllOnDelivery();
		totWaitingDelivery=adminOrderMapper.selectAllWaitingDelivery();
		totDoneDelivery=adminOrderMapper.selectAllTotDoneDelivery();
		totWaitingRefundDelivery=adminOrderMapper.selectAllWaitingRefund();
		totDoneRefundDelivery=adminOrderMapper.selectAllDoneRefund();
		selectedTotal=adminOrderMapper.selectedTotal(pagingMap);
		
		System.out.println("service안의 totOrders==>>>"+totOrders);
		System.out.println("service안의 totOnDelivery==>>>"+totOnDelivery);
		System.out.println("service안의 totDoneDelivery==>>>"+totDoneDelivery);
		System.out.println("service안의 totWaitingRefundDelivery==>>>"+totWaitingRefundDelivery);
		System.out.println("service안의 totDoneRefundDelivery==>>>"+totDoneRefundDelivery);
		
		viewMap.put("orderList", orderList);
		viewMap.put("totOrders", totOrders);
		viewMap.put("totWaitingDelivery", totWaitingDelivery);
		viewMap.put("totOnDelivery", totOnDelivery);
		viewMap.put("totDoneDelivery", totDoneDelivery);
		viewMap.put("totWaitingRefundDelivery", totWaitingRefundDelivery);
		viewMap.put("totDoneRefundDelivery", totDoneRefundDelivery);
		
		return viewMap;
	}
	
	@Override
	@Transactional
	public int changeDelivery(Map<String, Object> changeMap) {
		int res = adminOrderMapper.updateDelivery(changeMap);
		if(changeMap.get("change_deliveryStatus").equals("반품완료")) {
			System.out.println("change_deliveryStatus================"+changeMap.get("change_deliveryStatus"));
			res +=adminMemberMapper.updateMember(changeMap);
			res +=adminProductMapper.updateProduct2(changeMap);
		}
		return res;
	}


	@Override
	public void addRefund(Map<String, Object> requestMap) {
		
		//배송완료에서 반품대기중으로 바꾸기
		String waitingRefund="반품대기중";
		requestMap.put("waitingRefund", waitingRefund);
		adminOrderMapper.setUpRefund(requestMap);
		//반품대기중인 상품 refund테이블에 넣기
		//반품리스트뽑고 그래프 만들고 오더목록에서 지우기까지 
		//반품확정나면 오더목록에서 지우기
		/* adminOrderMapper.deleteOrder(requestMap); */
	
	}

}

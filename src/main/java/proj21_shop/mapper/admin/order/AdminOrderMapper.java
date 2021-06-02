package proj21_shop.mapper.admin.order;

public interface AdminOrderMapper {
	// 주문이 있는지 없는지 확인
	String atLeastOneOrder();

	// 총 판매 금액
	int getTotalAvenue();

	// 총 주문 건 수
	int getTotalOrderCount();

	// 총 주문 수
	int selectTotalOrders();

	// 배송 준비 중 수
	int selectAllWaitingDelivery();
	
	// 배송 중 수
	int selectAllOnDelivery();

	// 배송 완료 수
	int selectAllTotDoneDelivery();

	// 환불 완료 수
	int selectAllDoneRefund();

	// 환불 대기 수
	int selectAllWaitingRefund();
}

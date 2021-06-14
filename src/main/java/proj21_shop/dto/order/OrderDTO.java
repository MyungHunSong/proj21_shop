package proj21_shop.dto.order;

import java.sql.Date;

import proj21_shop.dto.product.ProductDTO;

public class OrderDTO {
	private String orderMemberId;

	private int orderNum;
	private int proNum;

	private int orderProNum;
	private String orderMemberName;
	private int orderProQuantity;
	private int orderPrice;
	private int orderDiscount;
	private String receiverName;
	private String receiverTel1;
	private String receiverTel2;
	private String deliveryAddr1;
	private String deliveryAddr2;
	private String deliveryAddr3;
	private String deliveryStatus;
	private String requestToDelivery;
	private ProductDTO proName;
	private Date orderDate;

	private String whoPay;
	private String whichBank;
	private String acountNum;

	public String getOrderMemberId() {
		return orderMemberId;
	}

	public void setOrderMemberId(String orderMemberId) {
		this.orderMemberId = orderMemberId;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public int getOrderProNum() {
		return orderProNum;
	}

	public void setOrderProNum(int orderProNum) {
		this.orderProNum = orderProNum;
	}

	public String getOrderMemberName() {
		return orderMemberName;
	}

	public void setOrderMemberName(String orderMemberName) {
		this.orderMemberName = orderMemberName;
	}

	public int getOrderProQuantity() {
		return orderProQuantity;
	}

	public void setOrderProQuantity(int orderProQuantity) {
		this.orderProQuantity = orderProQuantity;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getOrderDiscount() {
		return orderDiscount;
	}

	public void setOrderDiscount(int orderDiscount) {
		this.orderDiscount = orderDiscount;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverTel1() {
		return receiverTel1;
	}

	public void setReceiverTel1(String receiverTel1) {
		this.receiverTel1 = receiverTel1;
	}

	public String getReceiverTel2() {
		return receiverTel2;
	}

	public void setReceiverTel2(String receiverTel2) {
		this.receiverTel2 = receiverTel2;
	}

	public String getDeliveryAddr1() {
		return deliveryAddr1;
	}

	public void setDeliveryAddr1(String deliveryAddr1) {
		this.deliveryAddr1 = deliveryAddr1;
	}

	public String getDeliveryAddr2() {
		return deliveryAddr2;
	}

	public void setDeliveryAddr2(String deliveryAddr2) {
		this.deliveryAddr2 = deliveryAddr2;
	}

	public String getDeliveryAddr3() {
		return deliveryAddr3;
	}

	public void setDeliveryAddr3(String deliveryAddr3) {
		this.deliveryAddr3 = deliveryAddr3;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getRequestToDelivery() {
		return requestToDelivery;
	}

	public void setRequestToDelivery(String requestToDelivery) {
		this.requestToDelivery = requestToDelivery;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getWhoPay() {
		return whoPay;
	}

	public void setWhoPay(String whoPay) {
		this.whoPay = whoPay;
	}

	public String getWhichBank() {
		return whichBank;
	}

	public void setWhichBank(String whichBank) {
		this.whichBank = whichBank;
	}

	public String getAcountNum() {
		return acountNum;
	}

	public void setAcountNum(String acountNum) {
		this.acountNum = acountNum;
	}

	public ProductDTO getProName() {
		return proName;
	}

	public void setProName(ProductDTO proName) {
		this.proName = proName;
	}

}

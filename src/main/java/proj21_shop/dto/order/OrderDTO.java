package proj21_shop.dto.order;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.dto.product.ProductImageDTO;

public class OrderDTO {

	private String memberId;

	private String orderMemberId;

	private int proNum;// 제품번호

	private int orderProNum;// 주문번호: 한번에 살경우 중복된 번호로 나온다.

	private List<ProductDTO> proName; // 1:다 관계이므로 List 사용

	private ProductImageDTO productImageDTO;
	private ProductDTO productDTO;

	private String orderMemberName;
	private int orderProQuantity;
	private int orderPrice;// 총 가격
	private int orderDiscount;
	private String receiverName;
	private String receiverTel1;
	private String receiverTel2;
	private String deliveryAddr1;
	private String deliveryAddr2;
	private String deliveryAddr3;
	private String deliveryStatus;
	private String requestToDelivery;

	private Date orderDate;

	private String whoPay;
	private String whichBank;
	private String acountNum;

	public ProductDTO getProductDTO() {
		return productDTO;
	}

	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public ProductImageDTO getProductImageDTO() {
		return productImageDTO;
	}

	public void setProductImageDTO(ProductImageDTO productImageDTO) {
		this.productImageDTO = productImageDTO;
	}

	public String getOrderMemberId() {
		return orderMemberId;
	}

	public void setOrderMemberId(String orderMemberId) {
		this.orderMemberId = orderMemberId;
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

	public List<ProductDTO> getProName() {
		return proName;
	}

	public void setProName(List<ProductDTO> proName) {
		this.proName = proName;
	}

	@Override
	public String toString() {
		return String.format(
				"OrderDTO [memberId=%s, orderMemberId=%s, proNum=%s, orderProNum=%s, proName=%s, productImageDTO=%s, orderMemberName=%s, orderProQuantity=%s, orderPrice=%s, orderDiscount=%s, receiverName=%s, receiverTel1=%s, receiverTel2=%s, deliveryAddr1=%s, deliveryAddr2=%s, deliveryAddr3=%s, deliveryStatus=%s, requestToDelivery=%s, orderDate=%s, whoPay=%s, whichBank=%s, acountNum=%s]",
				memberId, orderMemberId, proNum, orderProNum, proName, productImageDTO, orderMemberName,
				orderProQuantity, orderPrice, orderDiscount, receiverName, receiverTel1, receiverTel2, deliveryAddr1,
				deliveryAddr2, deliveryAddr3, deliveryStatus, requestToDelivery, orderDate, whoPay, whichBank,
				acountNum);
	}

}

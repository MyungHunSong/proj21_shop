package proj21_shop.dto.order;

import java.sql.Date;

public class OrderDTO {
	private String orderMemberId;
	
	private int orderNum;
	private int proNum;
	
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
	
	private Date orderDate;
	
	private String whoPay;
	private String whichBank;
	private String acountNum;
	
	
}

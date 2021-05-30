package proj21_shop.dto.order;

import java.sql.Date;

public class OrderDTO {
	private String order_member_id;
	
	private int order_num;
	private int pro_num;
	
	private String order_member_name;
	private int order_pro_quantity;
	private int order_price;
	private int order_discount;
	private String receiver_name;
	private String receiver_tel1;
	private String receiver_tel2;
	private String delivery_addr1;
	private String delivery_addr2;
	private String delivery_addr3;
	private String delivery_status;
	private String request_to_delivery;
	
	private Date order_date;
	
	private String who_pay;
	private String which_bank;
	private String acount_num;
	
	
}

package proj21_shop.dto.product;

import java.sql.Date;

public class ProductDTO {

	private int pro_num;
	private String pro_code;//?? 필요 없지 않나?
	private String pro_category;    
	private String pro_name; 
	private String pro_price;    
	private String pro_salesrate;    
	private Date pro_cre_date;   
	private String pro_status; //제품 상태
	private Date pro_input_date; //제품 재 입고(update) 일
	
	private String pro_quantity;    
	private String pro_content; //제품 설명
	
	private String pro_sold;
	private String pro_color;
	
	private String pro_imgfileName;
	
	
}

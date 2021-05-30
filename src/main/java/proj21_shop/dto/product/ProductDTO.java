package proj21_shop.dto.product;

import java.sql.Date;

public class ProductDTO {

	private int proNum;
	private String proCode;//?? 필요 없지 않나?
	private String proCategory;    
	private String proName; 
	private String proPrice;    
	private String proSalesrate;    
	private Date proCreDate;   
	private String proStatus; //제품 상태
	private Date proInputDate; //제품 재 입고(update) 일
	
	private String proQuantity;    
	private String proContent; //제품 설명
	
	private String proSold;
	private String proColor;
	
	private String proImgfileName;
	
	
}

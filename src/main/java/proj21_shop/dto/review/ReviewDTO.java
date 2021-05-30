package proj21_shop.dto.review;

import java.sql.Date;

public class ReviewDTO {

	private int review_num; 
	private int pro_num;
	
	private String member_id;
	private String review_content; 
	private String review_imagefilename1; 
	private String review_imagefilename2; 
	
	private Date review_date;
	
	private int review_replyCount; 
	private int review_star;
}

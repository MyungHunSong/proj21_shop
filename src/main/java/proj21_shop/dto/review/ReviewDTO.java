package proj21_shop.dto.review;

import java.sql.Date;

public class ReviewDTO {

	private int reviewNum; 
	private int proNum;
	
	private String memberId;
	private String reviewContent; 
	private String reviewImagefilename1; 
	private String reviewImagefilename2; 
	
	private Date reviewDate;
	
	private int reviewReplyCount; 
	private int reviewStar;
}

package proj21_shop.dto.product;

import java.sql.Date;

public class ProductDTO {

	private int proNum;
	private int proCategory;
	private String proName;
	private String proPrice;
	private String proContent; // 제품 설명

	private String proSalesrate;
	private Date proCreDate;

	private String proStatus; // 제품 상태
	private int proColor;
	private int proSize;
	private String proQuantity;
	private String proSold;

	private int proHits;
	private int reReplyCount;

	private String proImgfileName;
	private Date proInputDate; // 제품 재 입고(update) 일
 
	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public int getProCategory() {
		return proCategory;
	}

	public void setProCategory(int proCategory) {
		this.proCategory = proCategory;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProPrice() {
		return proPrice;
	}

	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public String getProSalesrate() {
		return proSalesrate;
	}

	public void setProSalesrate(String proSalesrate) {
		this.proSalesrate = proSalesrate;
	}

	public Date getProCreDate() {
		return proCreDate;
	}

	public void setProCreDate(Date proCreDate) {
		this.proCreDate = proCreDate;
	}

	public String getProStatus() {
		return proStatus;
	}

	public void setProStatus(String proStatus) {
		this.proStatus = proStatus;
	}

	public int getProColor() {
		return proColor;
	}

	public void setProColor(int proColor) {
		this.proColor = proColor;
	}

	public int getProSize() {
		return proSize;
	}

	public void setProSize(int proSize) {
		this.proSize = proSize;
	}

	public String getProQuantity() {
		return proQuantity;
	}

	public void setProQuantity(String proQuantity) {
		this.proQuantity = proQuantity;
	}

	public String getProSold() {
		return proSold;
	}

	public void setProSold(String proSold) {
		this.proSold = proSold;
	}

	public int getProHits() {
		return proHits;
	}

	public void setProHits(int proHits) {
		this.proHits = proHits;
	}

	public int getReReplyCount() {
		return reReplyCount;
	}

	public void setReReplyCount(int reReplyCount) {
		this.reReplyCount = reReplyCount;
	}

	public String getProImgfileName() {
		return proImgfileName;
	}

	public void setProImgfileName(String proImgfileName) {
		this.proImgfileName = proImgfileName;
	}

	public Date getProInputDate() {
		return proInputDate;
	}

	public void setProInputDate(Date proInputDate) {
		this.proInputDate = proInputDate;
	}

}

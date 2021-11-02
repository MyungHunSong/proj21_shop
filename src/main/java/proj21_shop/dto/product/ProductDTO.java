package proj21_shop.dto.product;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import proj21_shop.dto.order.OrderDTO;

public class ProductDTO {

	private int proNum;
	private int proCategory;
	private String proName;
	@NotNull
	private int proPrice;
	@NotBlank(message = "빈칸이 있으면 안됩니다.")
	private String proContent; // 제품 설명
	private List<OrderDTO> orderCode;//제품 각각의 주문번호

	private int proSalesrate;
	private Date proCreDate;

	private String proStatus; // 제품 상태
	private int proColor;
	private int proSize;
	private int proQuantity;
	private int proSold;

	private int proHits;
	private int reReplyCount;

	private String proImgfileName;
	private Date proInputDate; // 제품 재 입고(update) 일
 
	public ProductDTO(int proNum, int proCategory, String proName, int proPrice, String proContent, int proSalesrate, String proStatus,
			int proColor, int proSize, int proQuantity) {
		this.proNum = proNum;
		this.proCategory = proCategory;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proContent = proContent;
		this.proSalesrate = proSalesrate;
		this.proStatus = proStatus;
		this.proColor = proColor;
		this.proSize = proSize;
		this.proQuantity = proQuantity;
	}

	public ProductDTO() {
	}

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

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public int getProSalesrate() {
		return proSalesrate;
	}

	public void setProSalesrate(int proSalesrate) {
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

	public int getProQuantity() {
		return proQuantity;
	}

	public void setProQuantity(int proQuantity) {
		this.proQuantity = proQuantity;
	}

	public int getProSold() {
		return proSold;
	}

	public void setProSold(int proSold) {
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
	

	public List<OrderDTO> getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(List<OrderDTO> orderCode) {
		this.orderCode = orderCode;
	}

	@Override
	public String toString() {
		return String.format(
				"ProductDTO [proNum=%s, proCategory=%s, proName=%s, proPrice=%s, proContent=%s, proSalesrate=%s, proCreDate=%s, proStatus=%s, proColor=%s, proSize=%s, proQuantity=%s, proSold=%s, proHits=%s, reReplyCount=%s, proImgfileName=%s, proInputDate=%s]",
				proNum, proCategory, proName, proPrice, proContent, proSalesrate, proCreDate, proStatus, proColor,
				proSize, proQuantity, proSold, proHits, reReplyCount, proImgfileName, proInputDate);
	}

	
	
}

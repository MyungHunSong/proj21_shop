package proj21_shop.dto.review;

import java.sql.Date;

public class ReviewReplyDTO {
	private int reRepNum;
	private int reNum;
	private String reRepMember;
	private String reRepContent;
	private Date reRepDate;

	public int getReRepNum() {
		return reRepNum;
	}

	public void setReRepNum(int reRepNum) {
		this.reRepNum = reRepNum;
	}

	public int getReNum() {
		return reNum;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
	}

	public String getReRepMember() {
		return reRepMember;
	}

	public void setReRepMember(String reRepMember) {
		this.reRepMember = reRepMember;
	}

	public String getReRepContent() {
		return reRepContent;
	}

	public void setReRepContent(String reRepContent) {
		this.reRepContent = reRepContent;
	}

	public Date getReRepDate() {
		return reRepDate;
	}

	public void setReRepDate(Date reRepDate) {
		this.reRepDate = reRepDate;
	}

	@Override
	public String toString() {
		return String.format("ReviewReplyDTO [reRepNum=%s, reNum=%s, reRepMember=%s, reRepContent=%s, reRepDate=%s]",
				reRepNum, reNum, reRepMember, reRepContent, reRepDate);
	}

}

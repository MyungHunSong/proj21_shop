package proj21_shop.dto.qna;

import java.sql.Date;

public class QnaDTO {
	private int qIndex;
	private String qTitle;
	private String qOption;
	private String qMember;
	private String qContent;
	private String qFile;
	private Date qDate;
	private int qHit;
	private int qGroup;
	private int qStep;
	private int qIndent;
	private String qOp;
	
	
	// 페이지 이동 시도
	// 여기까지.
	
	

	// 공지 - 번호
	public String getqOp() {
		return qOp;
	}

	public void setqOp(String qOp) {
		this.qOp = qOp;
	}
	// 공지 - 번호

	public QnaDTO() {}
	
	public QnaDTO(String qOption) {
		this.qOption = qOption;
	}

	public int getqIndex() {
		return qIndex;
	}
	public void setqIndex(int qIndex) {
		this.qIndex = qIndex;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqOption() {
		return qOption;
	}
	public void setqOption(String qOption) {
		this.qOption = qOption;
	}
	public String getqMember() {
		return qMember;
	}
	public void setqMember(String qMember) {
		this.qMember = qMember;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqFile() {
		return qFile;
	}
	public void setqFile(String qFile) {
		this.qFile = qFile;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public int getqHit() {
		return qHit;
	}
	public void setqHit(int qHit) {
		this.qHit = qHit;
	}
	public int getqGroup() {
		return qGroup;
	}
	public void setqGroup(int qGroup) {
		this.qGroup = qGroup;
	}
	public int getqStep() {
		return qStep;
	}
	public void setqStep(int qStep) {
		this.qStep = qStep;
	}
	public int getqIndent() {
		return qIndent;
	}
	public void setqIndent(int qIndent) {
		this.qIndent = qIndent;
	}

	@Override
	public String toString() {
		return String.format(
				"QnaDTO [qIndex=%s, qTitle=%s, qOption=%s, qMember=%s, qContent=%s, qFile=%s, qDate=%s, qHit=%s, qGroup=%s, qStep=%s, qIndent=%s]",
				qIndex, qTitle, qOption, qMember, qContent, qFile, qDate, qHit, qGroup, qStep, qIndent);
	}
	
	
}

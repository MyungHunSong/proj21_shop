package proj21_shop.dto.qna;

public class PageDTO {
	private Integer displayRowCount = 10; // 출력할 갯수
	private Integer rowStart; // 시작행번호
	private Integer rowEnd; // 종료번호
	private Integer totPage; // 전체페이지
	private Integer totRow = 0; // 전체페이지 수
	private Integer page; // 현재페이지
	private Integer pageStart; // 시작페이지
	private Integer pageEnd; // 종료페이지
	
	public PageDTO() {}
	
	public Integer getDisplayRowCount() {
		return displayRowCount;
	}
	public void setDisplayRowCount(Integer displayRowCount) {
		this.displayRowCount = displayRowCount;
	}
	public Integer getRowStart() {
		return rowStart;
	}
	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}
	public Integer getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(Integer rowEnd) {
		this.rowEnd = rowEnd;
	}
	public Integer getTotPage() {
		return totPage;
	}
	public void setTotPage(Integer totPage) {
		this.totPage = totPage;
	}
	public Integer getTotRow() {
		return totRow;
	}
	public void setTotRow(Integer totRow) {
		this.totRow = totRow;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageStart() {
		return pageStart;
	}
	public void setPageStart(Integer pageStart) {
		this.pageStart = pageStart;
	}
	public Integer getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(Integer pageEnd) {
		this.pageEnd = pageEnd;
	}

	@Override
	public String toString() {
		return String.format(
				"PageDTO [displayRowCount=%s, rowStart=%s, rowEnd=%s, totPage=%s, totRow=%s, page=%s, pageStart=%s, pageEnd=%s]",
				displayRowCount, rowStart, rowEnd, totPage, totRow, page, pageStart, pageEnd);
	}
	
	
}

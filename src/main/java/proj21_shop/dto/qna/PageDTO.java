package proj21_shop.dto.qna;

public class PageDTO {
	private int totPage; // 게시판 글 전체 개수
	private int displayRowCount = 10; // 게시판 화면에서 한번에 보여질 페이지 번호의 개수 ( 1,2,3,4,5,6,7,9,10)
	
	private int startPage; // 현재 화면에서 보이는 startPage 번호
	private int endPage; // 현재 화면에 보이는 endPage 번호
	
	private boolean back; // 페이징 이전 버튼 활성화 여부
	private boolean next; // 페이징 다음 버튼 활서화 여부

	private Criteria cri;
	
	public PageDTO() {}

	public int getTotPage() {
		return totPage;
	}
 
	public void setTotPage(int totPage) {
		this.totPage = totPage;
		
		calcData();
	}
	// 페이징 하기위한 조건.
	private void calcData() {
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayRowCount) * displayRowCount);
		
		startPage = (endPage - displayRowCount)+1;
		
		//게시판의 실제 마지막 페이지 번호.
		int tempEndPage = (int)(Math.ceil(totPage / (double)cri.getPerPageNum()));
		
		// endpage의 값은 tempEndPage보다 클수 없어야함.
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		back = startPage == 1? false:true;
		next = endPage * cri.getPerPageNum() >= totPage ? false:true;
	}
	

	public int getDisplayRowCount() {
		return displayRowCount;
	}

	public void setDisplayRowCount(int displayRowCount) {
		this.displayRowCount = displayRowCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isBack() {
		return back;
	}

	public void setBack(boolean back) {
		this.back = back;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getQnaDto() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
}

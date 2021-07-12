package proj21_shop.dto.qna;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
// 페이징을 위한 DTO (여기서 전체갯수, 시작페이지, 끝페이지... 등등을 계산해서 쓸꺼다.)
public class PageDTO {
	private SearchCriteria cri;
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next; 
	
	private int displayPageNum=10;
	
	
	public PageDTO() {}
	
	public Criteria getCri() {
		return cri;
	}

	public PageDTO(SearchCriteria cri, int totalCount) {
		this.cri = cri;
		this.totalCount = totalCount;
	}

	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	// 목록 하단의 페이지 번호 출력을 위한 계산식들 -시작-
	private void calcData() {
		
		
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum); // => 끝 페이지 번호의 계산. 
		/*
		 ex)페이지 번호의 갯수: 10
		  	 현재 페이지: 3
		 	 계산식: Math.ceil(3/10) * 10
		 	 끝 페이지 번호: 10
		 */
		startPage = (endPage - displayPageNum)+1; //=> 시작 페이지 번호의 계산.		
		/*
		 끝 페이지 번호에서 페이지 번호의 갯수를 빼고 1을 더해 주기만 하면된다.
		 ex)끝 페이지 번호: 10
		 페이지 번호의 갯수: 10
		 계산식: (10-10) + 1
		 시작 페이지 번호: 1
		*/
		if(startPage <= 0) {
			startPage = 1;
		}
		// 끝 페이지 번호는 다시 한번 계산을 통해 값을 보정해야함.
		// ex 20 = Math.ceil(1/20) * 20;
		// 5 = Math.ceil(100/20);
		int tempEndPage = (int)(Math.ceil(totalCount/ (double) cri.getPerPageNum()));
		
		if(endPage> tempEndPage) {
			endPage= tempEndPage;
		}
		// 이전 & 다음 링크의 계산.
		// 페이지 번호의 갯수가 10이고, 끝 페이지 번호가 10인 상황에서 전체 기시글 숫자가 101? 다음 링크는 true가 되야함.
		prev = startPage == 1? false:true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false:true;
	}
	// 목록 하단의 페이지 번호 출력을 위한 계산식들 -끝-
	
	
	// uri 자동생성 메서드 추가
	// 자동으로 bulid 해주는 uriComponents.
	// 쓰는 이유: 여러개의 파라미터를 이용하여 URL(주소)를 작성핼 때에 굉장히 편하게 작성할 수 있게끔 도와준다. 
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
		//=> 게시판 페이지 주소 붙이기 (jsp 게시판 페이지에 가면 페이징 & 검색문에 쓸것들이다)
		.queryParam("page", page) 
		.queryParam("pagePageNum", cri.getPerPageNum()) 
		.queryParam("searchType", cri.getSearchType())
		.queryParam("keyword", encoding(cri.getKeyword()))
		.build();
		
		return uriComponents.toUriString();
	}
	// keyword 유효성 검사. ( 검색 keyword를 말한다. ex=> 제목이 환불인걸 찾고 싶다  검색: 환 or 환불 등등 근데 없다면 그레 빈값 리턴
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return " ";
		}
		
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		}catch (UnsupportedEncodingException e) {
			return " ";
		}
	}
	
	// makeQuery(int page) => 검색문 로직에 붙여줄 메서드다. qna_page에 가보면 이것을 쓰고잇다. ( 모델로 받아와서)
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();	
	}
	// uri 끝
	

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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
}

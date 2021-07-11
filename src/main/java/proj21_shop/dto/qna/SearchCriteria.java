package proj21_shop.dto.qna;

// 검색을 위한 type과 keyword 를 
public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;

	public SearchCriteria() {}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return String.format("SearchCriteria [searchType=%s, keyword=%s]", searchType, keyword);
	}
}

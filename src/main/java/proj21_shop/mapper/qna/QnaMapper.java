package proj21_shop.mapper.qna;

import java.util.List;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.qna.SearchCriteria;

public interface QnaMapper {
	// 전체 검색용
	List<QnaDTO> selectByAll();
	// 고객센터 QNA 화면 목록.
	List<QnaDTO> selectByAllQnaPage();
	 
	List<QnaDTO> getList();
	
	// qna 페이지 번호
	public List<QnaDTO> listPaging(int page);
	// 페이징에 필요한것.
	List<QnaDTO> listCriteria(Criteria cri);
	int countArticles(Criteria cri);
	
	// 검색창 만들기.
	List<QnaDTO> listSearch(SearchCriteria searchCriteria);
	int countSearchedArticles(SearchCriteria searchCriteria);
		
	//번호 클릭시 내용 보이기 & 조회수 증가. (위에껀 쓸모도 없음)
	int updateHitsCount(int qIndex);
	
	// 관리자용 답글 페이제.
	int insertQnaForAdmin(QnaDTO qDto);
}

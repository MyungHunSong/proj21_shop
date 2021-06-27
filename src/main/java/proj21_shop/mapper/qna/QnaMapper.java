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
	// 관리자용 수정 삭제.
	int modifyForAdmin(QnaDTO qDto);
	int deleteForAdmin(QnaDTO qDto);
	
	// 회원 글쓰기 추가, 수정, 삭제. & 관리자 추가, 수정, 삭제
	int insertQnaForMember(QnaDTO qDto);
	int modifyQnaForMember(QnaDTO qDto);
	int deleteQnaForMember(QnaDTO qDto);
	// 수정시 식별자 번호를 타고 들어갈수 있도록.
	QnaDTO selectWhereIndexForModify(int idx);
	
	// 내 주문내역 보러가기.
	List<QnaDTO> selectWhereIndexForMyQna(String qMem);
	
}

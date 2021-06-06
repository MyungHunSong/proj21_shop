package proj21_shop.mapper.qna;

import java.util.ArrayList;
import java.util.List;

import proj21_shop.dto.qna.QnaDTO;

public interface QnaMapper {
	// 전체 검색용
	QnaDTO selectByAll();
	// 고객센터 QNA 화면 목록.
	List<QnaDTO> selectByAllQnaPage();
	// qna 페이지 추가 & 10 초과시 넘기기.
	ArrayList<QnaDTO> selectPageList(int page, int limit);
	
}

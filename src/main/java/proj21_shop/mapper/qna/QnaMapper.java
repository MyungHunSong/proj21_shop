package proj21_shop.mapper.qna;

import java.util.List;

import proj21_shop.dto.qna.QnaDTO;

public interface QnaMapper {
	// 전체 검색용
	QnaDTO selectByAll();
	// 고객센터 QNA 화면 목록.
	List<QnaDTO> selectByAllQnaPage();
}

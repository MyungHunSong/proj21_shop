package proj21_shop.service.qna;

import proj21_shop.dto.qna.QnaDTO;

public interface QnaInsertService {
	// 번호검색해서 내용보기.(이거 활요해서 답글 작업도 한다)
	QnaDTO selectQnaContent(int qIndex);
	
	int updateHitCount(int qIndex);
	
}

package proj21_shop.service.qna;

import proj21_shop.dto.qna.QnaDTO;

public interface QnaInsertService {
	// 조회수 증가.	
	int updateHitCount(int qIndex);	
	
	// 관리자용 답글 페이제.
	int insertQnaForAdmin(QnaDTO qDto);
	// 관리자용 수정 삭제.
		int modifyForAdmin(QnaDTO qDto);
		int deleteForAdmin(QnaDTO qDto);
	// 회원용 추가,수정,삭제
	int insertQnaForMember(QnaDTO qDto);
	int modifyQnaForMember(QnaDTO qDto);
	int deleteQnaForMember(QnaDTO qDto);
}

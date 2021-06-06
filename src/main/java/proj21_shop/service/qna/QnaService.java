package proj21_shop.service.qna;

import java.util.List;

import proj21_shop.dto.qna.QnaDTO;

public interface QnaService {
	List<QnaDTO> selectByAllQnaPage();
}

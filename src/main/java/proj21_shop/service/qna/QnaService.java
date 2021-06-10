package proj21_shop.service.qna;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.QnaDTO;

@Service
public interface QnaService {
	List<QnaDTO> selectByAllQnaPage();

	int selectTotalCount();

	// qna 페이지 번호
	public List<QnaDTO> listPaging(int page);

	// 페이징에 필요한것.
	List<QnaDTO> listCriteria(Criteria cri);
	int countArticles(Criteria cri);
}

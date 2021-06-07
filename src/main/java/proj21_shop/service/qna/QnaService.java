package proj21_shop.service.qna;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.QnaDTO;

@Service
public interface QnaService {
	List<QnaDTO> selectByAllQnaPage();
	List<QnaDTO> selectPageList(Criteria cri);
}

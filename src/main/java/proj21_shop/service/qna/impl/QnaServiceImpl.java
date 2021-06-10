package proj21_shop.service.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.mapper.qna.QnaMapper;
import proj21_shop.service.qna.QnaService;
@Service
public class QnaServiceImpl implements QnaService {
	
	QnaDTO qnaDTO;
 
	@Autowired
	private QnaMapper mapper;
	
	// 공지 맨위로 밑으로는 일반 사항들.
	@Override
	public List<QnaDTO> selectByAllQnaPage() {
		return mapper.selectByAllQnaPage();
	}

	// 일단 놔두는 용
	@Override
	public int selectTotalCount() {
		return 0;
	}
	
	 //page 처리하기
	@Override
	public List<QnaDTO> listCriteria(Criteria cri) {
		
		return mapper.listCriteria(cri);
	}
	
	@Override
	public List<QnaDTO> listPaging(int page) {
		if(page <= 0 ) {
			page = 1;
		}
		
		page = (page-1)*10;
		
		return  mapper.listPaging(page);
	}

	@Override
	public int countArticles(Criteria cri) {
		
		return mapper.countArticles(cri);
	}
}

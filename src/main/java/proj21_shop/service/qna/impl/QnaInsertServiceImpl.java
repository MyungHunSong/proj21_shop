package proj21_shop.service.qna.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.mapper.qna.QnaMapper;
import proj21_shop.service.qna.QnaInsertService;

@Service
public class QnaInsertServiceImpl implements QnaInsertService {
	@Autowired
	private QnaMapper qMapper;

	@Override
	public QnaDTO selectQnaContent(int qIndex) {
		
				qMapper.updateHitsCount(qIndex);
		return qMapper.selectQnaContent(qIndex);
	}

	@Override
	public int updateHitCount(int qIndex) {
		return qMapper.updateHitsCount(qIndex);
	}

}

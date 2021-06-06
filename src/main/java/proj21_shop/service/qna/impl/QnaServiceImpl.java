package proj21_shop.service.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.mapper.qna.QnaMapper;
import proj21_shop.service.qna.QnaService;
@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper qMapper;
	
	// 공지 맨위로 밑으로는 일반 사항들.
	@Override
	public List<QnaDTO> selectByAllQnaPage() {
		return qMapper.selectByAllQnaPage();
	}

}

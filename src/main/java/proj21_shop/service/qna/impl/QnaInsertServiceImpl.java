package proj21_shop.service.qna.impl;

import java.util.List;

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
	public int updateHitCount(int qIndex) {
		return qMapper.updateHitsCount(qIndex);
	}

	@Override
	public int insertQnaForAdmin(QnaDTO qDto) {
		
		return qMapper.insertQnaForAdmin(qDto);
	}

	@Override
	public int modifyForAdmin(QnaDTO qDto) {
		
		return qMapper.modifyForAdmin(qDto);
	}

	@Override
	public int deleteForAdmin(QnaDTO qDto) {
		
		return qMapper.deleteForAdmin(qDto);
	}

	// 회원용 추가 수정 삭제.
	@Override
	public int insertQnaForMember(QnaDTO qDto) {
		
		
		
		return qMapper.insertQnaForMember(qDto);
	}

	@Override
	public int modifyQnaForMember(QnaDTO qDto) {
		
		return qMapper.modifyQnaForMember(qDto);
	}

	@Override
	public int deleteQnaForMember(QnaDTO qDto) {
		
		return qMapper.deleteQnaForMember(qDto);
	}

	@Override
	public QnaDTO selectWhereIndexForModify(int idx) {
		
		return qMapper.selectWhereIndexForModify(idx);
	}

	@Override
	public List<QnaDTO> selectWhereIndexForMyQna(String qMem) {
		
		return qMapper.selectWhereIndexForMyQna(qMem);
	}

}

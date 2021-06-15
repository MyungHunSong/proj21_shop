package proj21_shop.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.mapper.review.MyReviewMapper;
import proj21_shop.service.review.MyReviewService;

@Service
public class MyReviewServiceImpl implements MyReviewService {

	@Autowired
	private MyReviewMapper mapper;
	
	@Override
	public List<ReviewDTO> selectReviewByMember(String memberId) {
		return mapper.selectReviewByMember(memberId);
	}

	@Override
	public List<QnaDTO> selectQnaByMember(String memberId) {
		return mapper.selectQnaByMember(memberId);
	}

	@Override
	public List<ReviewDTO> selectDetailReviewByMember(String memberId) {
		return mapper.selectDetailReviewByMember(memberId);
	}

}

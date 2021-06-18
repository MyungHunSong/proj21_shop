package proj21_shop.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.dto.review.ReviewReplyDTO;
import proj21_shop.mapper.review.ReviewReplyMapper;
import proj21_shop.service.review.ReviewReplyService;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Autowired
	private ReviewReplyMapper mapper;

	@Override
	public List<ReviewDTO> selectReviewByProNum(int proNum) {
		return mapper.selectReviewByProNum(proNum);
	}

	@Override
	public List<ReviewReplyDTO> selectReviewReply(int reviewNo) {
		return mapper.selectReviewReply(reviewNo);
	}

	@Override
	public int insertReviewReply(ReviewReplyDTO reviewReply) {
		return mapper.insertReviewReply(reviewReply);
	}

	@Override
	public int updateReviewReply(ReviewReplyDTO reviewReply) {
		return mapper.updateReviewReply(reviewReply);
	}

	@Override
	public int deleteReviewReply(int reviewReplyNo) {
		return mapper.deleteReviewReply(reviewReplyNo);
	}

}

package proj21_shop.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.dto.review.ReviewReplyDTO;
import proj21_shop.exception.MemberNotFoundException;
import proj21_shop.exception.MemberNotLoginException;
import proj21_shop.exception.NoReplyContentAndIdExeption;
import proj21_shop.mapper.member.MemberMapper;
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
		if(reviewReply.getReRepMember().isEmpty()) {
			throw new MemberNotLoginException("로그인이 필요합니다.");
		}
		if(reviewReply.getReRepContent().isEmpty()) {
			throw new NoReplyContentAndIdExeption("내용을 적어 주세요");
		}
		return mapper.insertReviewReply(reviewReply);
	}

	@Override
	public int updateReviewReply(ReviewReplyDTO reviewReply) {
		ReviewReplyDTO review = new ReviewReplyDTO();
		review.setReRepMember(reviewReply.getReRepMember());
		review.setReRepNum(reviewReply.getReRepNum());
		System.out.println(mapper.selectMemberIdAndReRepNum(review));
		if(mapper.selectMemberIdAndReRepNum(review) == null) {
			throw new MemberNotFoundException("자신이 쓴 글만 수정 할수 있습니다.");
		}
		return mapper.updateReviewReply(reviewReply);
	}

	@Override
	public int deleteReviewReply(ReviewReplyDTO reviewReply) {
		System.out.println(reviewReply);
		ReviewReplyDTO review = new ReviewReplyDTO();
		review.setReRepMember(reviewReply.getReRepMember());
		review.setReRepNum(reviewReply.getReRepNum());
		System.out.println(mapper.selectMemberIdAndReRepNum(review));
		if(mapper.selectMemberIdAndReRepNum(review) == null) {
			throw new MemberNotFoundException("자신이 쓴 글만 삭제 할수 있습니다.");
		}
		return mapper.deleteReviewReply(reviewReply);
	}

}

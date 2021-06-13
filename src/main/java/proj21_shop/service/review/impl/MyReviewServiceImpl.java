package proj21_shop.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}

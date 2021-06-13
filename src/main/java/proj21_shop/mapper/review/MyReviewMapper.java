package proj21_shop.mapper.review;

import java.util.List;

import proj21_shop.dto.review.ReviewDTO;

public interface MyReviewMapper {
	List<ReviewDTO> selectReviewByMember(String memberId);
}

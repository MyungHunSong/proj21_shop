package proj21_shop.mapper.review;

import java.util.List;

import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.review.ReviewDTO;

public interface MyReviewMapper {
	List<ReviewDTO> selectReviewByMember(String memberId);
	List<QnaDTO> selectQnaByMember(String memberId);
	List<ReviewDTO> selectDetailReviewByMember(String memberId);
}

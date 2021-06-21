package proj21_shop.mapper.review;

import java.util.List;

import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.dto.review.ReviewReplyDTO;

public interface ReviewReplyMapper {
	
	/*삭제나 수정하기전 아이디 비교*/
	ReviewReplyDTO selectMemberIdAndReRepNum(ReviewReplyDTO reviewReply);
	
	/* 후기 목록 */
	List<ReviewDTO> selectReviewByProNum(int proNum);
	
	/* 후기하나에 댓글 목록 */
	List<ReviewReplyDTO> selectReviewReply(int reviewNo);
	
	/* 댓글 추가 */
	int insertReviewReply(ReviewReplyDTO reviewReply);
	
	/* 댓글 수정 */
	int updateReviewReply(ReviewReplyDTO reviewReply);
	
	/* 댓글 삭제 */
	int deleteReviewReply(ReviewReplyDTO reviewReply);
}

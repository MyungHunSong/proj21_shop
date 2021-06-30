package proj21_shop.service.review;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.review.ReviewDTO;

@Service
public interface MyReviewService {
	List<ReviewDTO> selectReviewByMember(String memberId);
	List<QnaDTO> selectQnaByMember(String memberId);
	List<ReviewDTO> selectDetailReviewByMember(ReviewDTO reviewDTO);
	List<OrderDTO> selectProductDetailByMember(OrderDTO orderDTO);
	int insertReview(ReviewDTO reviewDTO);
	int updateReview(ReviewDTO reviewDTO);
	int updateReviewCount(int proNum);//리뷰쓸 때 리뷰수 증가
	List<QnaDTO> selectQnaContentByMember(QnaDTO qnaDTO);
}

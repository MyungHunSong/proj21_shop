package proj21_shop.mapper.review;

import java.util.List;

import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.review.ReviewDTO;

public interface MyReviewMapper {
	List<ReviewDTO> selectReviewByMember(String memberId);
	List<QnaDTO> selectQnaByMember(String memberId);
	List<ReviewDTO> selectDetailReviewByMember(ReviewDTO reviewDTO);
	List<OrderDTO> selectProductDetailByMember(OrderDTO orderDTO);
	int insertReview(ReviewDTO reviewDTO);
}

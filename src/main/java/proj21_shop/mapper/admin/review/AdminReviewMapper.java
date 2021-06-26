package proj21_shop.mapper.admin.review;

import java.util.List;
import java.util.Map;

import proj21_shop.dto.review.ReviewDTO;

public interface AdminReviewMapper {

	// 모든 후기 불러오기
	List<ReviewDTO> selectAllReviews(Map<String, Object> pagingMap);
	// 후기 삭제하기
	// 검색 후기 수
	int selectedTotalReviews(Map<String, Object> pagingMap);
	
}

package proj21_shop.service.admin.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.mapper.admin.review.AdminReviewMapper;

@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService {

	@Autowired
	AdminReviewMapper adminReviewMapper;
	
	@Override
	public Map<String, Object> listReviews(Map<String, Object> pagingMap) {
		
		List<ReviewDTO> listReviews = adminReviewMapper.selectAllReviews(pagingMap);
		int selectedReviews = adminReviewMapper.selectedTotalReviews(pagingMap);
		
		Map<String, Object> reviewsMap = new HashMap<String, Object>();
		
		reviewsMap.put("listReviews", listReviews);
		reviewsMap.put("selectedReviews", selectedReviews);
		
		return reviewsMap;
		
	}

}

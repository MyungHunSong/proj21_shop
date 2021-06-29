package proj21_shop.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductDTO;

@Service
public interface ProductListService {
	
	/* 옷목록화면 리스트 용*/
	List<ProductDTO> showProducts(int proCategory);
	
	/* 옷 상세 정보 보기((같은 카테고리 같은색상 이지만)제품별 사이즈마다 재고량이 다르기 때문에 리스트로 받음) */
	List<ProductDTO> showProductDetailByProNum(int proNum);
	
	/*옷 리스트에서 상세보기로 들어오는 순간 옷 조회수 +1해준다.*/
	int updateProhits(int proNum);
	
	//메인화면 옷 목록
	List<ProductDTO> selectProductMain(Map<String, Object> condition);
	
	/*페이징*/
	/*세일하는 제품 목록 */ 
	List<ProductDTO> selectProductSale(Map<String, Object> saleProduct);
	/*전체 결과의 수를 검색*/
	Integer selectCountByProductSale(Map<String, Object> condition);
}

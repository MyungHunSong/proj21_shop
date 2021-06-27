package proj21_shop.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductDTO;

@Service
public interface ProductListService {
	List<ProductDTO> showProducts(int proCategory);
	
	List<ProductDTO> showProductDetailByProNum(int proNum);
	
	int updateProhits(int proNum);
	
	//메인화면 옷 목록
	List<ProductDTO> selectProductMain(Map<String, Object> condition);
	
	//옷목록 리스트 여러가지 조건으로 검색
	List<ProductDTO> selectProductByCondition(Map<String, Object> condition);
	
	//옷 이름으로 검색
	List<ProductDTO> selectProductByproName(String proName);
	
	//세일하는 제품 목록 페이징
	List<ProductDTO> selectProductSale(Map<String, Object> saleProduct);
	Integer selectCountByProductSale();
}

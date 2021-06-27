package proj21_shop.mapper.product;

import java.util.List;
import java.util.Map;

import proj21_shop.dto.product.ProductDTO;

public interface ProductListMapper {
	
	// 옷목록화면 리스트 용
	List<ProductDTO> selectProductByProImgState(int proCategory);
	
	List<ProductDTO> selectProductDetailByProNum(int proNum);
	
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

package proj21_shop.mapper.admin.product;

import java.util.List;
import java.util.Map;

import proj21_shop.dto.product.ProductDTO;

public interface AdminProductMapper {

	//<!-- 총 제품 수 -->
	int selectTotalProducts();
	//<!-- 신상품 수 -->
	int selectNewProducts();
	//<!-- 판매량이 많은 제품 수 -->
	int selectBestProducts();
	//<!-- 추천상품 수 -->
	int selectSteadyProducts();
	//<!-- 세일중인 제품 수-->
	int selectOffProducts();
	//<!-- 판매 중지된 상품 수-->
	int selectOutProducts();
	//<!-- 조건 별 제품 리스트 뽑아오기 -->
	List<ProductDTO> selectAllProducts(Map<String, Object> pagingMap);
	//<!-- 검색한 제품 수 -->
	int selectedTotalProducts(Map pagingMap);
	
//	int selectOrderedTotal(Map pagingMap);
	
//	List<ProductDTO> selectAllProductsDetail();
}

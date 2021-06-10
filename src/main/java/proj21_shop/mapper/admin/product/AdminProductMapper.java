package proj21_shop.mapper.admin.product;

import java.util.List;
import java.util.Map;

import proj21_shop.dto.product.ProductDTO;

public interface AdminProductMapper {

	int selectTotalProducts();

	int selectedTotalProducts(Map pagingMap);
	//
	int selectNewProducts();
	//
	int selectBestProducts();
	//
	int selectSteadyProducts();
	//
	int selectOffProducts();
	//
	int selectOutProducts();

	int selectOrderedTotal(Map pagingMap);
	
	List<ProductDTO> selectAllProducts(Map pagingMap);
	
	List<ProductDTO> selectAllProductsDetail();
}

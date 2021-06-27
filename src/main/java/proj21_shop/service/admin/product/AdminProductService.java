package proj21_shop.service.admin.product;

import java.util.Map;

import proj21_shop.dto.product.ProductDTO;

public interface AdminProductService {
	Map<String, Object> listProducts(Map<String, Object> pagingMap);
	
	int addNewProduct(Map<String, Object> newProductMap);

	int modifyModel(ProductDTO product);
	
	int changeProduct(Map<String, Object> changeMap);
	
	int deleteProducts(Map<String, Object> deleteMap);

	Map<String, Object> getProductStatics();
	
}

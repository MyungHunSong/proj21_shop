package proj21_shop.service.admin.product;

import java.util.Map;

public interface AdminProductService {
	Map<String, Object> listProducts(Map<String, Object> pagingMap);
	
	int addNewProduct(Map<String, Object> newProductMap);

	void addNewModel(Map<String, Object> productDetailMap);
	
	void deleteProducts(Map<String, Object> deleteMap);

	Map<String, Object> getProductStatics();
	
	int selectAllCoat();
}

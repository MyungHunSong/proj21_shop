package proj21_shop.service.admin.product;

import java.util.Map;

public interface AdminProductService {
	Map<String, Object> listProducts(Map<String, Object> pagingMap);
}

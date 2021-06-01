package proj21_shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductImageDTO;

public interface ProductListService {
	List<ProductImageDTO> showProducts(int proImgState,int proCategory);
}

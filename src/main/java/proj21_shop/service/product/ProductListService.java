package proj21_shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductDTO;

@Service
public interface ProductListService {
	List<ProductDTO> showProducts(int proImgState,int proCategory);
	
	ProductDTO showProductDetailByProNum(int proNum);
	
	int updateProhits(int proNum);
}

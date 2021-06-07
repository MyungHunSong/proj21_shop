package proj21_shop.mapper.product;

import java.util.List;

import proj21_shop.dto.product.ProductImageDTO;

public interface ProductListMapper {
	
	// 옷목록화면 리스트 용
	List<ProductImageDTO> selectProductByProImgState(int proImgState, int proCategory);
	
	ProductImageDTO selectProductDetailByProNum(int proNum);
	
	int updateProhits(int proNum);
}

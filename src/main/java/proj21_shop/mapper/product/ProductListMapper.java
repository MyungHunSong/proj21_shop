package proj21_shop.mapper.product;

import java.util.List;

import proj21_shop.dto.product.ProductDTO;

public interface ProductListMapper {
	
	// 옷목록화면 리스트 용
	List<ProductDTO> selectProductByProImgState(int proImgState, int proCategory);
	
	List<ProductDTO> selectProductDetailByProNum(int proNum);
	
	int updateProhits(int proNum);
}

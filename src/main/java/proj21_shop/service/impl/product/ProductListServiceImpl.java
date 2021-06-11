package proj21_shop.service.impl.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.product.ProductListMapper;
import proj21_shop.service.product.ProductListService;

@Service
public class ProductListServiceImpl implements ProductListService{
	
	@Autowired
	private ProductListMapper service;
	
	@Override
	public List<ProductDTO> showProducts(int proImgState,int proCategory) {
		List<ProductDTO> list = service.selectProductByProImgState(proImgState, proCategory);
		return list;
	}

	@Override
	public ProductDTO showProductDetailByProNum(int proNum) {
		ProductDTO product = service.selectProductDetailByProNum(proNum);
		return product;
	}

	@Override
	public int updateProhits(int proNum) {
		return service.updateProhits(proNum);
	}
	
}

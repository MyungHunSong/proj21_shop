package proj21_shop.service.impl.product;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductImageDTO;
import proj21_shop.mapper.ProductListMapper;
import proj21_shop.service.product.ProductListService;

@Service
public class ProductListServiceImpl implements ProductListService{
	
	@Autowired
	private ProductListMapper mapper;

	@Override
	public List<ProductImageDTO> showProducts(int proImgState,int proCategory) {
		List<ProductImageDTO> list = mapper.selectProductByProImgState(proImgState,proCategory);
		return list;
	}
	
}

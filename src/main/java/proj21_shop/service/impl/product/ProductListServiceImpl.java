package proj21_shop.service.impl.product;

import java.util.List;
import java.util.Map;

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
	public List<ProductDTO> showProductDetailByProNum(int proNum) {
		List<ProductDTO> product = service.selectProductDetailByProNum(proNum);
		return product;
	}

	@Override
	public int updateProhits(int proNum) {
		return service.updateProhits(proNum);
	}

	//옷목록 리스트 여러가지 조건으로 검색
	@Override
	public List<ProductDTO> selectProductByCondition(Map<String, Object> condition) {
		return service.selectProductByCondition(condition);
	}

	@Override
	public List<ProductDTO> selectProductByproName(String proName) {
		return service.selectProductByproName(proName);
	}
	
	//메인화면 옷 목록
	@Override
	public List<ProductDTO> selectProductMain(Map<String, Object> condition) {
		return service.selectProductMain(condition);
	}
	
}

package proj21_shop.service.impl.admin.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.admin.product.AdminProductMapper;
import proj21_shop.service.admin.product.AdminProductService;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	AdminProductMapper adminProductMapper;

	@Override
	public Map<String, Object> listProducts(Map<String, Object> pagingMap) {
		Map<String, Object> productsMap = new HashMap<String, Object>();

		List<ProductDTO> productsList = adminProductMapper.selectAllProducts(pagingMap);
		int selectedProducts = adminProductMapper.selectedTotalProducts(pagingMap);
		int totProducts = adminProductMapper.selectTotalProducts();
		int newProducts = adminProductMapper.selectNewProducts();
		int bestProducts = adminProductMapper.selectBestProducts();
		int steadyProducts = adminProductMapper.selectSteadyProducts();
		int offProducts = adminProductMapper.selectOffProducts();
		int outProducts = adminProductMapper.selectOutProducts();
		int orderedTotal = adminProductMapper.selectOrderedTotal(pagingMap);

		System.out.println("service에서 =productsList:"+productsList);    
		System.out.printf("service에서 =totProducts:%s\n", totProducts);      
		System.out.printf("service에서 =bestProducts:%s\n", bestProducts);    
		System.out.printf("service에서 =newProducts:%s\n", newProducts);      
		System.out.printf("service에서 =steadyProducts:%s\n", steadyProducts);
		System.out.printf("service에서 =offProducts:%s\n", offProducts);      
		System.out.printf("service에서 =outProducts:%s\n", outProducts);      
		System.out.printf("service에서 =orderedTotal:%s\n", orderedTotal);    
		System.out.printf("service에서 =selectedProducts:%s\n", selectedProducts);    
		
		productsMap.put("productsList", productsList);
		productsMap.put("totProducts", totProducts);
		productsMap.put("bestProducts", bestProducts);
		productsMap.put("newProducts", newProducts);
		productsMap.put("steadyProducts", steadyProducts);
		productsMap.put("offProducts", offProducts);
		productsMap.put("outProducts", outProducts);
		productsMap.put("orderedTotal", orderedTotal);
		productsMap.put("selectedProducts", selectedProducts);

		return productsMap;
	}

}

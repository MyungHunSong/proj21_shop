package proj21_shop.service.admin.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.admin.product.AdminProductMapper;
import proj21_shop.service.impl.admin.product.AdminProductService;

public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	AdminProductMapper adminProductMapper;
	@Override
	public Map listProducts(Map pagingMap) {
		
		Map<String,Object> productsMap=new HashMap();
		
		List<ProductDTO> productsList=adminProductMapper.selectAllProducts(pagingMap); //��ǰ��� ��������
		int totProducts=adminProductMapper.selectTotalProducts();//��ü����
		 int selectedProducts=adminProductMapper.selectedTotalProducts(pagingMap); 
		 System.out.println(" selectedProducts:"+selectedProducts);
		int newProducts=adminProductMapper.selectNewProducts();//����ǰ����
		int bestProducts=adminProductMapper.selectBestProducts();//����Ʈ��������
		int steadyProducts=adminProductMapper.selectSteadyProducts();//���׵𼿷�����
		int offProducts=adminProductMapper.selectOffProducts();//�����߰���
		int outProducts=adminProductMapper.selectOutProducts();//ǰ������
		int orderedTotal=adminProductMapper.selectOrderedTotal(pagingMap);
		
		productsMap.put("productsList", productsList);
		productsMap.put("totProducts", totProducts);
		productsMap.put("bestProducts", bestProducts);
		productsMap.put("newProducts", newProducts);
		productsMap.put("steadyProducts", steadyProducts);
		productsMap.put("offProducts", offProducts);
		productsMap.put("outProducts", outProducts);
		productsMap.put("orderedTotal", orderedTotal);
		 productsMap.put("selectedProducts", selectedProducts); 
		
		List<ProductDTO> modelList=adminProductMapper.selectAllProductsDetail();
		
		productsMap.put("modelList", modelList);
		
		return productsMap;
	}
}

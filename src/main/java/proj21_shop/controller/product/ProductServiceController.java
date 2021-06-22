package proj21_shop.controller.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sun.javafx.collections.MappingChange.Map;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.service.product.ProductListService;

@RestController
@RequestMapping("/api")
public class ProductServiceController {
 
	@Autowired
	private ProductListService service;
	
	/* 옷목록화면 */
	@GetMapping("/productlist/{proImgState}/{proCategory}")
	public ResponseEntity<Object> products(@PathVariable int proImgState,@PathVariable int proCategory){
		List<ProductDTO> list = service.showProducts(proImgState,proCategory);
		return ResponseEntity.ok(list);
	}
	
	/* 옷 상세보기 */
	@GetMapping("/productDetail/{proNum}")
	public ResponseEntity<Object> productDetail(@PathVariable int proNum){
		service.updateProhits(Integer.parseInt(proNum+"1"));
		List<ProductDTO> product= service.showProductDetailByProNum(proNum);
		return ResponseEntity.ok(product);
	}
	
	/* 옷목록 에서 여러 조건(가격순, 조회순, 신상, 가격범위)으로 검색 */
	@GetMapping("/selectProductsCondition/{orderKind}/{priceRange}")
	public ResponseEntity<Object> selectProductsCondition(@PathVariable String orderKind,@PathVariable int priceRange){
		HashMap<String, Object> condition = new HashMap<String,Object>();
		condition.put("orderKind", orderKind);
		condition.put("priceRange", priceRange); 
		if(condition.isEmpty()) {
			condition.put("orderKind", "asc");
			condition.put("priceRange", 0); 
		}
		List<ProductDTO> products = service.selectProductByCondition(condition);
		return ResponseEntity.ok(products);
	}
	
	/*옷 이름으로 검색*/
	@GetMapping("/selectProductByProName/{proName}")
	public ResponseEntity<Object> selectProductByProName(@PathVariable String proName){
		return ResponseEntity.ok(service.selectProductByproName(proName));
	}
}

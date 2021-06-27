package proj21_shop.controller.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.service.product.ProductListService;

@RestController
@RequestMapping("/api")
public class ProductServiceController {
 
	@Autowired
	private ProductListService service;
	
	/* 옷목록화면 */
	@GetMapping("/productlist/{proCategory}")
	public ResponseEntity<Object> products(@PathVariable int proCategory){
		List<ProductDTO> list = service.showProducts(proCategory);
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
	@GetMapping("/selectProductsCondition/{proCategory}/{orderKind}/{priceRange}")
	public ResponseEntity<Object> selectProductsCondition(@PathVariable int proCategory,@PathVariable String orderKind,@PathVariable int priceRange){
		HashMap<String, Object> condition = new HashMap<String,Object>();
		condition.put("proCategory", proCategory);
		condition.put("orderKind", orderKind);
		condition.put("priceRange", priceRange); 
		List<ProductDTO> products = service.selectProductByCondition(condition);
		System.out.println(products);
		return ResponseEntity.ok(products);
	}
	
	/*옷 이름으로 검색*/
	@GetMapping("/selectProductByProName/{proName}")
	public ResponseEntity<Object> selectProductByProName(@PathVariable String proName){
		return ResponseEntity.ok(service.selectProductByproName(proName));
	}
	
	/*메인화면에서 여러조건(new,sale,recommend,best)으로 옷목록*/
	@GetMapping("/selectProductsMain/{proStatus}")
	public ResponseEntity<Object> selectProductsMain(@PathVariable String proStatus){
		HashMap<String, Object> condition = new HashMap<String, Object>();
		condition.put("proStatus", proStatus);
		return ResponseEntity.ok(service.selectProductMain(condition));
	} 
	
	@GetMapping("/selectProductsSale/{section}/{pageNum}/{priceRange}/{orderKind}")
	public ResponseEntity<Object> selectProductsSale(@PathVariable Integer section, @PathVariable Integer pageNum, 
		@PathVariable Integer priceRange, @PathVariable String orderKind){
		HashMap<String,Object> saleProduct = new HashMap<>();
		saleProduct.put("section",section);
		saleProduct.put("pageNum",pageNum);
		saleProduct.put("priceRange",priceRange);
		saleProduct.put("orderKind",orderKind);
		
		System.out.println("section"+section);
		System.out.println("pageNum"+pageNum);
		System.out.println("priceRange"+priceRange);
		System.out.println("orderKind"+orderKind);
		System.out.println("saleProduct"+saleProduct);
		
		return ResponseEntity.ok(service.selectProductSale(saleProduct));
	}
}

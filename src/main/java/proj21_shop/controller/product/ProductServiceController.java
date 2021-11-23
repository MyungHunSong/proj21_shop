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
	
	/* 옷 상세보기 */
	// main.jsp 의 $.get(proj21_shop/api/selectProductsMain/ + proStatus 영역) 
	@GetMapping("/productDetail/{proNum}")
	public ResponseEntity<Object> productDetail(@PathVariable int proNum){
		service.updateProhits(Integer.parseInt(proNum+"1"));
		List<ProductDTO> product= service.showProductDetailByProNum(proNum);
		System.out.println("/productDetail/{proNum} 영역 >>>: " + product);
		return ResponseEntity.ok(product);
	}
	
	/*메인화면에서 여러조건(new,sale,recommend,best)으로 옷목록*/
	@GetMapping("/selectProductsMain/{proStatus}")
	public ResponseEntity<Object> selectProductsMain(@PathVariable String proStatus){
		HashMap<String, Object> condition = new HashMap<String, Object>();
		condition.put("proStatus", proStatus);
		return ResponseEntity.ok(service.selectProductMain(condition));
	} 
	
	/*옷목록 화면 검색 및 조건별 정렬 , 위치 : productList.jsp 의 .get(contextPath/api/ 블라블라)*/
	/*세일인 옷은 페이징 까지 포함 ? 다른거는*/ 
	/*제품목록화면에서 여러조건(orderKind,priceRange,proCategory)으로 옷목록 검색 및 페이징*/
	@GetMapping("/selectProductsSale/{proCategory}/{section}/{pageNum}/{priceRange}/{orderKind}/{search}")
	public ResponseEntity<Object> selectProductsList(@PathVariable Integer proCategory, @PathVariable Integer section, @PathVariable Integer pageNum, 
		@PathVariable Integer priceRange, @PathVariable String orderKind, @PathVariable String search){
		HashMap<String,Object> saleProduct = new HashMap<>();
		saleProduct.put("search",search);
		saleProduct.put("proCategory",proCategory);
		saleProduct.put("section",section);
		saleProduct.put("pageNum",pageNum);
		saleProduct.put("priceRange",priceRange);
		saleProduct.put("orderKind",orderKind);
		
		System.out.println("'key' => proCategory = "+proCategory);
		System.out.println("'key' => section = "+section);
		System.out.println("'key' => pageNum = "+pageNum);
		System.out.println("'key' => priceRange ="+priceRange);
		System.out.println("'key' => orderKind ="+orderKind);
		System.out.println("'key' => search = " + search);
		
		System.out.println("'key' => saleProduct ="+saleProduct);
		System.out.println("'key' => search ="+search);
		
		return ResponseEntity.ok(service.selectProductSale(saleProduct));
	}
	
	/*페이징 : 총 검색 결과 수 구하기*/
	@GetMapping("/selectCountByProductSale/{priceRange}/{search}")
	public ResponseEntity<Object> countProdList(@PathVariable int priceRange, @PathVariable String search ){
		HashMap<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("search",search);
		condition.put("priceRange",priceRange);
		return ResponseEntity.ok(service.selectCountByProductSale(condition));
	}
}

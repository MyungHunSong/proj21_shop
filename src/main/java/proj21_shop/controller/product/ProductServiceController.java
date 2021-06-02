package proj21_shop.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.product.ProductImageDTO;
import proj21_shop.service.product.ProductListService;

@RestController
@RequestMapping("/api")
public class ProductServiceController {

	@Autowired
	private ProductListService service;
	
	/* 옷목록화면 */
	@GetMapping("/productlist/{proImgState}/{proCategory}")
	public ResponseEntity<Object> products(@PathVariable int proImgState,@PathVariable int proCategory){
		List<ProductImageDTO> list = service.showProducts(proImgState,proCategory);
		return ResponseEntity.ok(list);
	}
	
	/* 옷 상세보기 */
	@GetMapping("/productDetail/{proNum}")
	public ResponseEntity<Object> productDetail(@PathVariable int proNum){
		ProductImageDTO product= service.showProductDetailByProNum(proNum);
		return ResponseEntity.ok(product);
	}
}

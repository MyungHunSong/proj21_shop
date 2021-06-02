package proj21_shop.controller.productlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.service.product.ProductListService;

@RestController
@RequestMapping("/api")
public class ProductListServiceController {

	@Autowired
	private ProductListService service;

	@GetMapping("/productlist")
	public ResponseEntity<Object> products() {
		return ResponseEntity.ok(service.showProducts(1, 1));
	}
}

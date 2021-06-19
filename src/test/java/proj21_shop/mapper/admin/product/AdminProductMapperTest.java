package proj21_shop.mapper.admin.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shop.config.ContextRoot;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.dto.product.ProductImageDTO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class AdminProductMapperTest {
	protected static final Log log = LogFactory.getLog(AdminProductMapperTest.class);

	@Autowired
	private AdminProductMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	
	@Test
	public void test1InsertNewProduct() {
	    log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

//	    ProductDTO newProduct = new ProductDTO(2999, 2,"Test옷", 5000,"Test색 test종류 Test사이즈 입니다.", 10, "신상",99,9,10);
//	    new ProductDTO(3999, 3,"Test옷", 5000,"Test색 test종류 Test사이즈 입니다.", 10, "최고",99,9,10));
//	    new ProductDTO(4999, 4,"Test옷", 5000,"Test색 test종류 Test사이즈 입니다.", 10, "추천",99,9,10));
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("proNum",2999);
	    map.put("proCategory",2);
	    map.put("proName","Test옷");
	    map.put("proPrice",5000);
	    map.put("proContent","Test색 test종류 Test사이즈 입니다.");
	    map.put("proSalesrate",10);
	    map.put("proStatus","신상");
	    map.put("proColor",99);
	    map.put("proSize",9);
	    map.put("proQuantity",10);
	    int res = mapper.insertNewProduct(map);
	    
	    System.out.println("res========================="+res);
	    Assert.assertEquals(1, res);
	}
	@Test
	public void test2InsertProductImageFile() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		ArrayList<ProductImageDTO> list = new ArrayList<ProductImageDTO>();
		list.add(new ProductImageDTO(2999, "2999.jpg", 1));
		list.add(new ProductImageDTO(2999, "2999-1.jpg", 0));
		list.add(new ProductImageDTO(2999, "2999-2.jpg", 0));
//	    new ProductDTO(3999, 3,"Test옷", 5000,"Test색 test종류 Test사이즈 입니다.", 10, "최고",99,9,10));
//	    new ProductDTO(4999, 4,"Test옷", 5000,"Test색 test종류 Test사이즈 입니다.", 10, "추천",99,9,10));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		mapper.insertProductImageFile(list);
		
	}

//	@Test
//	public void test10DeleteProduct() {
//	    log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//
//	    List<Integer> courseIds = Arrays.asList(4, 5, 6);
//	        
//	    Map<String, Object> map = new HashMap<String, Object>();
//	    map.put("courseIds", courseIds);
//	        
//	    int res = mapper.deleteProducts(map);
//	    Assert.assertEquals(3, res);
//	}
	
	@Test
	public void test11SelectTotalProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectTotalProducts();
		log.debug("총 제품 수 ? >>" + res);
	}

	@Test
	public void test12SelectNewProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectNewProducts();
		log.debug("신상품 수?" + res);
	}

	@Test
	public void test13SelectBestProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectBestProducts();
		log.debug("최고품 수?" + res);
	}

	@Test
	public void test14SelectSteadyProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectSteadyProducts();
		log.debug("추천 상품 수?" + res);
	}

	@Test
	public void test15SelectOffProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectOffProducts();
		log.debug("세일 상품 수?" + res);
	}

	@Test
	public void test16SelectOutProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectOutProducts();
		log.debug("품절 상품 수?" + res);
	}
	
	@Test
	public void test17SelectedTotalProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proCategory", 1);
		map.put("proStatus", "판매중");
		map.put("keyword", "T");
		int res = mapper.selectedTotalProducts(map);
		Assert.assertNotNull(res);
		log.debug("검색한 제품 수?" + res);
		System.out.println();

	}

	@Test
	public void test18SelectAllProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("section", 1);
		map.put("pageNum", 1);
//		map.put("proCategory", 1);
//		map.put("proStatus", "판매중");
//		map.put("keyword", "T");
		List<ProductDTO> list = mapper.selectAllProducts(map);
		Assert.assertNotNull(list);
		System.out.println();
		for (ProductDTO t : list) {
			if (t.toString() != null) {
				System.out.println(t.toString());
			}
		}
	}
	
	@Test
	public void test19SelectOrderedTotal() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proStatus", "판매중");
		map.put("keyword", "T");
		map.put("proCategory", 1);
		int res = mapper.selectOrderedTotal(map);
		Assert.assertNotNull(res);
		log.debug("판매중인 수?" + res);
		System.out.println();
	}
	
	@Test
	public void test3SelectAllTShirts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res = mapper.selectAllTShirts();
		log.debug("총 반팔 수?" + res);

	}


}

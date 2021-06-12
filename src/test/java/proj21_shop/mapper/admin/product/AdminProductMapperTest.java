package proj21_shop.mapper.admin.product;

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
	public void test1SelectTotalProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectTotalProducts();
		log.debug("총 제품 수 ? >>" + res);
	}

	@Test
	public void test2SelectNewProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectNewProducts();
		log.debug("신상품 수?" + res);
	}

	@Test
	public void test3SelectBestProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectBestProducts();
		log.debug("최고품 수?" + res);
	}

	@Test
	public void test4SelectSteadyProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectSteadyProducts();
		log.debug("추천 상품 수?" + res);
	}

	@Test
	public void test5SelectOffProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectOffProducts();
		log.debug("세일 상품 수?" + res);
	}

	@Test
	public void test6SelectOutProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectOutProducts();
		log.debug("품절 상품 수?" + res);
	}
	
	@Test
	public void test7SelectedTotalProducts() {
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
	public void test8SelectAllProducts() {
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
	public void test9SelectOrderedTotal() {
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

}

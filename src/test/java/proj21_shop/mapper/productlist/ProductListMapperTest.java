package proj21_shop.mapper.productlist;

import java.util.HashMap;
import java.util.List;

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

import com.sun.javafx.collections.MappingChange.Map;

import proj21_shop.config.ContextRoot;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.product.ProductListMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class ProductListMapperTest {
	private static final Log log = LogFactory.getLog(ProductListMapperTest.class);
	
	@Autowired
	private ProductListMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	//@Test
	public void test01ShowProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ProductDTO> list =mapper.selectProductByProImgState(1, 1);
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	//@Test
	public void test02ShowProductDetailByProNum() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		List<ProductDTO> product = mapper.selectProductDetailByProNum(103);
		Assert.assertNotNull(product);
		System.out.println(product);
	}
	
	//@Test
	public void test03UpdateProductDetailByProNum() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
		int res = mapper.updateProhits(111);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test01ShowProductsByConditions() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		String orderKind = "desc";
		HashMap<String,Object> condition = new HashMap();
		condition.put("orderKind", orderKind);
		System.out.println(condition);
		List<ProductDTO> list = mapper.selectProductByCondition(condition);
		Assert.assertNotNull(list);
	}
	//@Test
	public void test01ShowProductsByConditionsDESC() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		String orderKind = "desc";
		HashMap<String,Object> condition = new HashMap();
		condition.put("orderKind", orderKind);
		System.out.println(condition);
		List<ProductDTO> list = mapper.selectProductByCondition(condition);
		Assert.assertNotNull(list);
	}

	//@Test
	public void test02ShowProductsByConditionsASC() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		String orderKind = "asc";
		HashMap<String,Object> condition = new HashMap();
		condition.put("orderKind", orderKind);
		System.out.println(condition);
		List<ProductDTO> list = mapper.selectProductByCondition(condition);
		Assert.assertNotNull(list);
	}

	//@Test
	public void test03ShowProductsByConditionsNEW() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		String orderKind = "신상";
		HashMap<String,Object> condition = new HashMap();
		condition.put("orderKind", orderKind);
		System.out.println(condition);
		List<ProductDTO> list = mapper.selectProductByCondition(condition);
		Assert.assertNotNull(list);
	}

	//@Test
	public void test04ShowProductsByConditionsHITS() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		String orderKind = "proHits";
		HashMap<String,Object> condition = new HashMap();
		condition.put("orderKind", orderKind);
		System.out.println(condition);
		List<ProductDTO> list = mapper.selectProductByCondition(condition);
		Assert.assertNotNull(list);
	}

	//@Test
	public void test05ShowProductsByConditionsBetween() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		/* int priceRange = 5; */
		String orderKind = "proHits";
		HashMap<String,Object> condition = new HashMap();
		/* condition.put("priceRange", priceRange); */
		condition.put("orderKind", orderKind);
		System.out.println(condition);
		List<ProductDTO> list = mapper.selectProductByCondition(condition);
		Assert.assertNotNull(list);
	}

	@Test
	public void test06ShowProductsByProName() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<ProductDTO> list = mapper.selectProductByproName("t");
		Assert.assertNotNull(list);
	}
}

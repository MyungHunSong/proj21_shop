package proj21_shop.mapper.productlist;

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

import proj21_shop.config.ContextRoot;
import proj21_shop.dto.product.ProductImageDTO;
import proj21_shop.mapper.ProductListMapper;

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

	@Test
	public void testShowProducts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<ProductImageDTO> list =mapper.selectProductByProImgState(1, 1);
		Assert.assertNotNull(list);
		System.out.println(list);
	}

}

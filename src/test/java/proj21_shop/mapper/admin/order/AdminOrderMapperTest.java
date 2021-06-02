package proj21_shop.mapper.admin.order;

import static org.junit.Assert.fail;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class AdminOrderMapperTest {
	protected static final Log log = LogFactory.getLog(AdminOrderMapperTest.class);

	@Autowired
	private AdminOrderMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test1AtLeastOneOrder() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		String res=mapper.atLeastOneOrder();
		Assert.assertEquals("true", res);
		log.debug("주문이 있나? >>" + res);
	}

}

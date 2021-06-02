package proj21_shop.mapper.admin.order;

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
	@Test
	public void test2GetTotalAvenue() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.getTotalAvenue();
		log.debug("총 판매 금액? >>" + res);

	}

	@Test
	public void test3GetTotalOrderCount() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.getTotalOrderCount();
		log.debug("총 주문 건 수?" + res);

	}

	@Test
	public void test4SelectTotalOrders() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectTotalOrders();
		log.debug("총 주문 수? >>" + res);

	}
	
	@Test
	public void test5SelectAllWaitingDelivery() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectAllWaitingDelivery();
		log.debug("배송준비중? >>" + res);

	}
	
	@Test
	public void test6SelectAllOnDelivery() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectAllOnDelivery();
		log.debug("배송 중? >>" + res);
	}
	
	@Test
	public void test7SelectAllTotDoneDelivery() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectAllTotDoneDelivery();
		log.debug("배송 완료? >>" + res);
	}
	
	@Test
	public void test8SelectAllDoneRefund() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectAllDoneRefund();
		log.debug("환불 완료? >>" + res);
	}
	
	@Test
	public void test9SelectAllWaitingRefund() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res=mapper.selectAllWaitingRefund();
		log.debug("환불 대기중? >>" + res);
	}

}

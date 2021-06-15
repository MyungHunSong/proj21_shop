package proj21_shop.service.order;

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
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OrderServiceTest {
	protected static final Log log = LogFactory.getLog(OrderServiceTest.class);
	
	@Autowired
	public OrderService service;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectById() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		MemberDTO member = service.selectById("test01");
		Assert.assertNotNull(member);
	}
	

	/*
	 * @Test public void test02trInsertOrder() {
	 * log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
	 * OrderDTO orderDTO = new OrderDTO(); orderDTO.setOrderMemberId(orderMemberId);
	 * orderDTO.setProNum(proNum); orderDTO.setOrderMemberName(orderMemberName); int
	 * res = service.trInsertOrder(orderDTO); Assert.assertEquals(3,res); }
	 */

}

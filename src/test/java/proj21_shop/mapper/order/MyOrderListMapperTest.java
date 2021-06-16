package proj21_shop.mapper.order;

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
import proj21_shop.dto.order.OrderDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MyOrderListMapperTest {
	private static final Log log = LogFactory.getLog(MyOrderListMapperTest.class);
	
	@Autowired
	private MyOrderListMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testSelectOrderByMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<OrderDTO> list = mapper.selectOrderByMember("test01");
		Assert.assertNotNull(list.toString());
	}
	
	@Test
	public void testSelectOrderDetailByMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setMemberId("test01");
		orderDTO.setOrderProNum(1);
		List<OrderDTO> list = mapper.selectOrderDetailByMember(orderDTO);
		Assert.assertNotNull(list.toString());
	}
}

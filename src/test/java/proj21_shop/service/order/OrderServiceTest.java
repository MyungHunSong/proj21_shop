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
import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.mapper.order.OrderMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OrderServiceTest {
	protected static final Log log = LogFactory.getLog(OrderServiceTest.class);
	
	@Autowired
	public OrderService service;
	
	@Autowired
	public OrderMapper orderMapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectById() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		MemberDTO member = service.selectById("test01");
		System.out.println(member);
		Assert.assertNotNull(member);
	}
	

	@Test
	public void test02trInsertOrder() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		OrderDTO orderDTO = new OrderDTO();
		
		orderDTO.setOrderMemberId("test02");
		orderDTO.setProNum(6163);
		orderDTO.setOrderMemberName("이종윤");
		orderDTO.setOrderProQuantity(1);
		orderDTO.setOrderPrice(5000);
		orderDTO.setOrderDiscount(0);
		orderDTO.setReceiverName("이종윤");
		orderDTO.setReceiverTel1("010-1234-5678");
		orderDTO.setReceiverTel2("010-1234-5678");
		orderDTO.setDeliveryAddr1("746858");
		orderDTO.setDeliveryAddr2("대구광역시 남구 봉덕동 이천로 51");
		orderDTO.setDeliveryAddr3("3층");
		orderDTO.setRequestToDelivery("배송참고사항");
		orderDTO.setWhoPay("이종윤");
		orderDTO.setWhichBank("국민");
		
		int res = service.trInsertOrder(orderDTO);
		Assert.assertEquals(3,res);
	}

}

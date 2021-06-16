package proj21_shop.mapper.order;

import java.util.ArrayList;
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
import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class OrderMapperTest {
	private static final Log log = LogFactory.getLog(OrderMapperTest.class);

	@Autowired
	private OrderMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	//@Test
	public void test01SelectAddress() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		AddressDTO address = new AddressDTO();
		address.setMemberAddr1("746858");
		address.setMemberAddr2("대구광역시 남구 봉덕동 이천로 51");
		address.setMemberAddr3("3층");
		address.setMemberId("test01");
		AddressDTO addressDTO = mapper.selectAddress(address);
		System.out.println(addressDTO);
		Assert.assertNotNull(addressDTO);
		
	}

	@Test
	public void test02InsertOrder() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		/*
		 * ('test01', 6163, '이종윤', 1, 5000, 0, '이종윤', '010-1234-5678', '010-1234-5678',
		 * 54545,'대구광역시 남구 봉덕동 이천로 51', '2층', '배송참고사항', '이종윤', '국민');
		 */
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrderMemberId("test01");
		orderDTO.setProNum(6163);
		orderDTO.setOrderMemberName("이종윤");
		orderDTO.setOrderProQuantity(1);
		orderDTO.setOrderPrice(5000);
		orderDTO.setOrderDiscount(0);
		orderDTO.setReceiverName("이종윤");
		orderDTO.setReceiverTel1("010-1234-5678");
		orderDTO.setReceiverTel2("010-1234-5678");
		orderDTO.setDeliveryAddr1("54545");
		orderDTO.setDeliveryAddr2("대구광역시 남구 봉덕동 이천로 51");
		orderDTO.setDeliveryAddr3("2층");
		orderDTO.setRequestToDelivery("배송참고사항");
		orderDTO.setWhoPay("이종윤");
		orderDTO.setWhichBank("국민");
		
		System.out.println(orderDTO);
		
		List<OrderDTO> order = new ArrayList<>();
		order.add(orderDTO);
		order.add(orderDTO);
		System.out.println(order);
		int res = mapper.insertOrder(order);
		
		Assert.assertEquals(2, res);
	}

	//@Test
	public void test03UpdateMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId("test01");
		memberDTO.setMemberPoint(300);
		memberDTO.setMemberTotalBuy(30000);
		memberDTO.setMemberTotalOrder(2);
		int res = mapper.updateMember(memberDTO);
		
		Assert.assertEquals(1,res);
	}

	//@Test
	public void test04InsertMemberAddress() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		AddressDTO address = new AddressDTO();
		address.setMemberId("test01");
		address.setMemberAddr1("54545");
		address.setMemberAddr2("대구광역시 남구 봉덕동 이천로 51");
		address.setMemberAddr3("10층");
		
		int res = mapper.insertMemberAddress(address);
		Assert.assertEquals(1,res);
	}

	//@Test
	public void test05UpdateProduct() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		ProductDTO pro = new ProductDTO();
		pro.setProNum(6163);
		
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProQuantity(1);
		productDTO.setProSold(1);
		productDTO.setProNum(6163);
		
		int res = mapper.updateProduct(productDTO);
		Assert.assertEquals(1,res);
	}

	//@Test
	public void test06DelteCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrderMemberId("test05");
		orderDTO.setProNum(4073);
		
		int res = mapper.deletCart(orderDTO);
		Assert.assertEquals(1,res);
	}

}

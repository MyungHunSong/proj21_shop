package proj21_shop.mapper.order;

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
import proj21_shop.dto.member.AddressDTO;

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

	@Test
	public void test01SelectAddress() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		AddressDTO address = new AddressDTO();
		address.setMemberAddr1("746858");
		address.setMemberAddr2("대구광역시 남구 봉덕동 이천로 51");
		address.setMemberAddr3("3층");
		address.setMemberId("test01");
		AddressDTO addressDTO = mapper.selectAddress(address);
		Assert.assertNotNull(addressDTO);
	}

	@Test
	public void test02InsertOrder() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		fail("Not yet implemented");
	}

	@Test
	public void test03UpdateMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		fail("Not yet implemented");
	}

	@Test
	public void test04InsertMemberAddress() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		fail("Not yet implemented");
	}

	@Test
	public void test05UpdateProduct() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		fail("Not yet implemented");
	}

}

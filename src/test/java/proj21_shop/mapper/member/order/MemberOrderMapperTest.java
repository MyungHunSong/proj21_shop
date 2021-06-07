package proj21_shop.mapper.member.order;


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
import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.order.MemberOrderMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MemberOrderMapperTest {
private static final Log log = LogFactory.getLog(MemberOrderMapperTest.class);
	
	@Autowired
	private MemberOrderMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
 
	@Test
	public void test01SelectCartByMemberId() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO newMem = new MemberDTO();
		newMem.setMemberId("test01");
		
		List<CartDTO> list = mapper.selectCartByMemberId(newMem);
		Assert.assertNotNull(list);
	}
 
	@Test
	public void test02InsertCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO newMem = new MemberDTO();
		newMem.setMemberId("test01");

		ProductDTO newPro = new ProductDTO();
		newPro.setProNum(1033);
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(newMem);
		cart.setCartProNum(newPro);
		cart.setCartProQuantity(1);
		
		int res = mapper.insertCart(cart);
		Assert.assertEquals(1, res);
		log.debug("res memid, proNum, 수량 >>" + res);
	}

	@Test
	public void test03DeleteCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.deleteCart(6);
		Assert.assertEquals(1, res);
		log.debug("proNum >>" + res);
		
	}
	
	@Test
	public void test04SelectCartByPronum() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		CartDTO cart = new CartDTO();
		ProductDTO pro =new ProductDTO();
		pro.setProNum(1113);
		
		MemberDTO mem = new MemberDTO();
		mem.setMemberId("test01");
		cart.setCartProNum(pro);
		cart.setMemberId(mem);
		CartDTO sel = mapper.selectCartByPronum(cart);
		Assert.assertNotNull(sel);
	}
	
	@Test
	public void test05UpdateCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		ProductDTO pro = new ProductDTO();
		pro.setProNum(1113);
		
		CartDTO cart = new CartDTO();
		cart.setCartProNum(pro);
		cart.setCartProQuantity(1);
		int res = mapper.updateCart(cart);
		Assert.assertEquals(1, res);
	}

}

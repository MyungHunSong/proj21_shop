package proj21_shop.mapper.member.order;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		CartDTO newMem = new CartDTO();
		MemberDTO mem = new MemberDTO();
		ProductDTO pro = new ProductDTO();
		
		pro.setProNum(4072);
		mem.setMemberId("test01");
		
		newMem.setMemberId(mem);
		newMem.setCartProNum(pro);
		System.out.println(newMem);
		
		List<CartDTO> list = mapper.selectCartByMemberId(newMem);
		Assert.assertNotNull(list);
	}
 
	//@Test
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

	//@Test
	public void test03DeleteCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.deleteCart(69);
		Assert.assertEquals(1, res);
		log.debug("proNum >>" + res);
	}
	
	//@Test
	public void test04SelectCartByCartNum() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		CartDTO cart = new CartDTO();
		cart.setCartNum(149);
		List<CartDTO> sel = mapper.selectCartByMemberId(cart);
		Assert.assertNotNull(sel);
	}
	
	//@Test
	public void test05UpdateCart() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		CartDTO cart = new CartDTO();
		cart.setCartNum(122);
		cart.setCartProQuantity(1);
		int res = mapper.updateCart(cart);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test06DeleteCarts() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Integer> cartNums = new ArrayList<Integer>();
		cartNums.add(104);
		cartNums.add(105);
		cartNums.add(106);
		System.out.println(cartNums);
		
		
		int res = mapper.deleteCarts(cartNums);
		Assert.assertEquals(3, res);
		log.debug("proNum >>" + res);
	}

}

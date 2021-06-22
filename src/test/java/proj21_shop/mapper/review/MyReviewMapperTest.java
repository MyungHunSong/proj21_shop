package proj21_shop.mapper.review;

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
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.review.ReviewDTO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class MyReviewMapperTest {
	protected static final Log log = LogFactory.getLog(MyReviewMapperTest.class);
	
	@Autowired
	private MyReviewMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectReviewByMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		List<ReviewDTO> list = mapper.selectReviewByMember("test01");
		Assert.assertNotNull(list);
	}

	//@Test
	public void test02SelectQnaByMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		List<QnaDTO> list = mapper.selectQnaByMember("test01");
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test03SelectDetailReviewByMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setMemberId("test01");
		reviewDTO.setProNum(6163);
		List<ReviewDTO> list = mapper.selectDetailReviewByMember(reviewDTO);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test04SelectProductDetailByMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setMemberId("test01");
		orderDTO.setProNum(3112);
		List<OrderDTO> list = mapper.selectProductDetailByMember(orderDTO);
		Assert.assertNotNull(list);
	}
	
}

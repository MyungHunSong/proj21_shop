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
import proj21_shop.dto.review.ReviewDTO;
import proj21_shop.dto.review.ReviewReplyDTO;
import proj21_shop.service.review.ReviewReplyService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ReviewReplyMapperTest {
	
	protected static final Log log = LogFactory.getLog(ReviewReplyMapperTest.class);

	@Autowired
	private ReviewReplyMapper mapper;
	
	@Autowired
	private ReviewReplyService service;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	//@Test
	public void test01SelectReviewReply() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		List<ReviewReplyDTO> list = mapper.selectReviewReply(1);
		Assert.assertNotNull(list);
	}

	//@Test
	public void test02InsertReviewReply() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		ReviewReplyDTO reviewReply = new ReviewReplyDTO();
		reviewReply.setReNum(1);
		/*reviewReply.setReRepMember("test01");*/
		reviewReply.setReRepContent("후기 작성 중중중"); 
		int res = service.insertReviewReply(reviewReply);
		Assert.assertEquals(1,res);
	}

	//@Test
	public void test03UpdateReviewReply() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		ReviewReplyDTO reviewReply = new ReviewReplyDTO();
		reviewReply.setReRepNum(15);
		reviewReply.setReRepMember("test01");
		reviewReply.setReRepContent("후기 중");
		
		int res = service.updateReviewReply(reviewReply);
		Assert.assertEquals(1,res);
	}

	//@Test
	public void test05DeleteReviewReply() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		ReviewReplyDTO reviewReply = new ReviewReplyDTO();
		reviewReply.setReRepMember("test01");
		reviewReply.setReRepNum(15);
		
		int res = service.deleteReviewReply(reviewReply);
		Assert.assertEquals(1,res);
	}

	//@Test
	public void test05selectReviewByProNum() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		List<ReviewDTO> list = mapper.selectReviewByProNum(616);
		Assert.assertNotNull(list);
	}
	
	//@Test
	public void test04selectMemberId() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		ReviewReplyDTO reviewReply = new ReviewReplyDTO();
		reviewReply.setReRepMember("test01");
		reviewReply.setReRepNum(15);
		ReviewReplyDTO b = mapper.selectMemberIdAndReRepNum(reviewReply);
		Assert.assertNotNull(b);
	}

	@Test
	public void test05selectMemberId() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		int res = service.selectMaxReRepNum();
		System.out.println(res);
	}
}

package proj21_shop.mapper.admin.review;

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
import proj21_shop.dto.review.ReviewDTO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class AdminReviewMapperTest {
	protected static final Log log = LogFactory.getLog(AdminReviewMapperTest.class);

	@Autowired
	private AdminReviewMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	@Test
	public void testSelectAllReviews() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", "test01");
		map.put("proNum", "");
		map.put("section", 1);
		map.put("pageNum", 1);
		List<ReviewDTO> list = mapper.selectAllReviews(map);
		Assert.assertNotNull(list);
		System.out.println();
		for (ReviewDTO t : list) {
			if (t.toString() != null) {
				System.out.println(t.toString());
			}
		}
	}

}

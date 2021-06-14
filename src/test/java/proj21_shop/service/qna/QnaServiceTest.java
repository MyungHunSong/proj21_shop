package proj21_shop.service.qna;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_shop.config.ContextRoot;
import proj21_shop.dto.qna.QnaDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
public class QnaServiceTest {
	
	protected static final Log log = LogFactory.getLog(QnaServiceTest.class);
	
	@Autowired
	private QnaService service;
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testSelectByAllQnaPage() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName() + "()");
		
		List<QnaDTO> list = service.selectByAllQnaPage();
		
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}
	



}

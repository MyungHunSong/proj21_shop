package proj21_shop.mapper.qna;

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
import proj21_shop.dto.qna.Criteria;
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.dto.qna.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class QnaMapperTest {
	protected static final Log log = LogFactory.getLog(QnaMapperTest.class);
	
	@Autowired
	private QnaMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	//@Test
	public void test01SelectByAllQnaPage() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		List<QnaDTO> qList = mapper.selectByAllQnaPage();
		Assert.assertNotNull(qList);
		qList.stream().forEach(System.out::println);
	}
	 
	//@Test
	public void test02TurnPageInfo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(10);
		
		List<QnaDTO> list = mapper.listCriteria(cri);
		Assert.assertNotNull(cri);
		list.stream().forEach(System.out::println);
		
 
		//List<QnaDTO> articles = mapper.listCriteria(cri);
		//Assert.assertNotNull(articles);
		//articles.stream().forEach(System.out::println);
	}
	
	//@Test
	public void test09ListSearch() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		
		SearchCriteria sCri = new SearchCriteria();
		sCri.setPage(1);
		sCri.setSearchType("a");
		sCri.setKeyword("");
		
		List<QnaDTO> list = mapper.listSearch(sCri);
		
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	//@Test
	public void test05updateHit() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		QnaDTO dto = new QnaDTO();
		
		int res = mapper.updateHitsCount(1);
		Assert.assertEquals(1, res);		
	}
	
	//@Test
	public void test06InsertReply() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		QnaDTO dto = new QnaDTO();
		dto.setqTitle("앗 죄송");
		dto.setqMember("admin");
		dto.setqContent("빠른 시일내에 조취해 드리 겠습니다.");
		dto.setqGroup(57);
		
		int res = mapper.insertQnaForAdmin(dto);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test07updateReply() {
		log.debug(Thread.currentThread().getStackTrace()[1].getClassName()+"()");
		QnaDTO dto = new QnaDTO();
		dto.setqGroup(57);
		dto.setqContent("배달안대");
		
		int res = mapper.modifyForAdmin(dto);
		Assert.assertEquals(1, res);
	}
	
	//@Test
	public void test08DeleteReply() {
		QnaDTO dto = new QnaDTO();
		dto.setqIndex(57);
		
		
		int res = mapper.deleteForAdmin(dto);
		Assert.assertEquals(1, res);
	}
	// 회원 글 추가 수정 삭제 테스트.
	@Test
	public void test09InsertMemberQna() {
		QnaDTO dto = new QnaDTO();
		dto.setqTitle("추천 드릴 만한게 있습니다.");
		dto.setqOption("제품문의");
		dto.setqMember("이상훈");
		dto.setqFile("text12345.jpg");
		int res = mapper.insertQnaForMember(dto);
		Assert.assertEquals(1, res);
	}
	
	@Test 
	public void test10ModifyMemberQna() {
		QnaDTO dto = new QnaDTO();
		dto.setqOption("환불문의");
		dto.setqContent("아 무슨.. 하 ......ㅎㅎㅎㅎㅎㅎㅎㅎㅎ 죽임마렵네요");
		dto.setqFile("toList.jpg");
		dto.setqIndex(78);
		
		int res = mapper.modifyQnaForMember(dto);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test11DeleteMemberQna() {
		QnaDTO dto = new QnaDTO();
		dto.setqIndex(78);
		dto.setqGroup(59);
		int res = mapper.deleteQnaForMember(dto);
		Assert.assertEquals(1, res);
	}
}

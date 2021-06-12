package proj21_shop.mapper.admin.member;

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
import proj21_shop.dto.member.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class AdminMemberMapperTest {
	protected static final Log log = LogFactory.getLog(AdminMemberMapperTest.class);

	@Autowired
	private AdminMemberMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test1SelectAllMembersList() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "이종");
		map.put("memberTotalBuy", "total_buy_desc");
		List<MemberDTO> list = mapper.selectAllMembersList(map);
		Assert.assertNotNull(list);
		System.out.println();
		for (MemberDTO t : list) {
			if (t.toString() != null) {
				System.out.println(t.toString());
			}
		}
	}

	@Test
	public void test2SelectTotalMembers() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res = mapper.selectTotalMembers();
		log.debug("총 회원 수?" + res);

	}

	@Test
	public void test3SelectAllMemberMen() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res = mapper.selectAllMemberMen();
		log.debug("총 남자 회원 수?" + res);

	}

	@Test
	public void test4SelectAllMemberWomen() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		int res = mapper.selectAllMemberWomen();
		log.debug("총 여자 회원 수?" + res);

	}

	@Test
	public void test5SelectedMembers() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "이종");
		map.put("memberGender", "FEMALE");
		int res = mapper.selectedMembers(map);
		Assert.assertNotNull(res);
		log.debug("검색한 회원 수?" + res);
		System.out.println();

	}

}

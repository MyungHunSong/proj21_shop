package proj21_shop.mapper.member;

import java.time.LocalDate;
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

import com.mysql.fabric.xmlrpc.base.Member;

import proj21_shop.config.ContextRoot;
import proj21_shop.dto.member.Gender;
import proj21_shop.dto.member.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class MemberMapperTest {

	private static final Log log = LogFactory.getLog(MemberMapperTest.class);

	@Autowired
	private MemberMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<MemberDTO> list = mapper.selectAll();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void test02SelectById() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO member = mapper.selectById("test01");
		Assert.assertNotNull(member);
		log.debug(member.toString());
	}

//	@Test
	public void test03InsertMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO member = new MemberDTO("test06", "123", "이종바", "010-1234-5678", LocalDate.of(1994, 8, 17),
				Gender.FEMALE, "기억에 남는 추억의 장소는?", "삿포로", "41559", "대구 북구 침산남로19길 8", "202동 1301호", "test6@test.co.kr");
		int res = mapper.insertMember(member);
		Assert.assertEquals(1, res);
		log.debug(member.toString());

	}

	@Test
	public void test04UpdateMember() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO member = new MemberDTO("test06", "010-9876-5432", "12345", "대구광역시 북구 침산남로 14길 50", "504동 1002호",
				"test06@hanmail.net");
		int res = mapper.updateMember(member);
		Assert.assertEquals(1, res);
		log.debug(member.toString());
	}

	@Test
	public void test05DeleteMember() { 
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO member = new MemberDTO("test06", 1);
		int res = mapper.deleteMember(member);
		Assert.assertEquals(1, res);
		log.debug(member.toString());
	}
	
	@Test
	public void test06UpdateTotalLogin() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO member = new MemberDTO();
		member.setMemberId("test01");
		int res = mapper.updateTotalLogin(member);
		Assert.assertEquals(1, res);
		
	}
	
	@Test
	public void test07selectMemberById() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		MemberDTO member = mapper.selectMemberById("test01");
		Assert.assertNotNull(member);
		log.debug(member.toString());

	}
}

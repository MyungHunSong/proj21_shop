package proj21_shop.service.impl.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shop.dto.cart.CartDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.admin.member.AdminMemberMapper;
import proj21_shop.mapper.admin.order.AdminOrderMapper;
import proj21_shop.mapper.order.CartMapper;
import proj21_shop.service.admin.member.AdminMemberService;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	AdminMemberMapper adminMemberMapper;
	
	@Autowired
	AdminOrderMapper adminOrderMapper;
	
	@Autowired
	CartMapper cartMapper;

	@Override
	public Map<String, Object> listMembers(Map<String, Object> pagingMap) {

		Map<String, Object> membersMap = new HashMap<String, Object>();

		int allMen, allWomen, totMembers, selectedMembers = 0;
		List<MemberDTO> membersList = null;
		// 남자회원수 가져오기
		allMen = adminMemberMapper.selectAllMemberMen();
		// 여자회원수 가져오기
		allWomen = adminMemberMapper.selectAllMemberWomen();
		// 총 회원수
		totMembers = adminMemberMapper.selectTotalMembers();
		// MemberList가져옴
		membersList = adminMemberMapper.selectAllMembersList(pagingMap);
		// MemberList가져온 사람 수
		selectedMembers = adminMemberMapper.selectedMembers(pagingMap);

		System.out.println("======allMen : " + allMen);
		System.out.println("======allWomen : " + allWomen);
		System.out.println("======totMembers : " + totMembers);
		System.out.println("======membersList : " + membersList);
		System.out.println("======selectedMembers : " + selectedMembers);
		membersMap.put("membersList", membersList);
		membersMap.put("totMembers", totMembers);
		membersMap.put("allMen", allMen);
		membersMap.put("allWomen", allWomen);
		membersMap.put("selectedMembers", selectedMembers);
		return membersMap;
	}

	@Override
	public void deleteMember(String memberId) {
		adminMemberMapper.deleteMember(memberId);
	}

	@Override
	public Map<String, Object> viewMember(Map searchMap) {
		Map<String, Object> returnMap = new HashMap();// returnMap 생성
		int averageOrder = 0;
		String onDelivery = null;
		String onCart = null;
		String onRefund = null;
		List<CartDTO> cartList = null;
		List<OrderDTO> orderList = null;
		List<OrderDTO> refundList = null;
		Map<String, Object> orderReturn = new HashMap();
		Map<String, Object> refundReturn = new HashMap();
		MemberDTO member = adminMemberMapper.selectMemberByCertain(searchMap);// member관련정보 따오기
		System.out.println(member.toString());
		String MemberId = member.getMemberId(); // 가져온 멤버에서 멤버코드가져오기
		System.out.println("MemberId>>>>>>>>>>>> :" + MemberId);
		// 주문한 이력 있으면
		String orderFlag = adminOrderMapper.haveOrdered(MemberId);
		
		
		System.out.println("orderFlag 배송중인거 있냐? :" + orderFlag);
		if (orderFlag.equals("true")) {
			averageOrder = adminOrderMapper.selectAverageOrder(MemberId);
			orderReturn.put("orderMemberId", MemberId);
			orderReturn.put("deliveryStatus", "배송중");
			// 배송중인 상품 검색
			onDelivery = adminOrderMapper.onDelivery(orderReturn);
			System.out.println("onDelivery 배송중인것===== :" + onDelivery);
			if(onDelivery.equals("0")) {
				System.out.println("onDelivery 배송준비중인것");
				orderReturn.remove("deliveryStatus");
				orderReturn.put("deliveryStatus", "배송준비중");
				onDelivery = adminOrderMapper.onDelivery(orderReturn);
				System.out.println("onDelivery 배송준비중인것===== :" + onDelivery);
			}
			//배송중인 제품들 출력
			orderList = adminOrderMapper.get_OrderList(orderReturn);
			System.out.println("get_OrderList 주문 리스트===== :" + orderList);
		}
		
		refundReturn.put("orderMemberId", MemberId);
		refundReturn.put("deliveryStatus", "반품대기중");
		String refundFlag = adminOrderMapper.haveRefunded(refundReturn);
		System.out.println("refundFlag 반품대기중인거 있냐? :" + refundFlag);
		if (refundFlag.equals("true")) {
			onRefund = adminOrderMapper.onRefund(refundReturn);
			System.out.println("onRefund 반품대기중인것=====" + onRefund);
			//반품중인 제품들 출력
			refundList = adminOrderMapper.get_OrderList(refundReturn);
		}
		// 장바구니에 담은 상품있으면
		String cartFlag = cartMapper.flagInCart(MemberId);
		System.out.println("cartFlag 장바구니가 있으면======== :" + cartFlag);
		if (cartFlag.equals("true")) {
			MemberDTO mem = new MemberDTO();
			mem.setMemberId(MemberId);
			CartDTO memId = new CartDTO();
			memId.setMemberId(mem);
			cartList = cartMapper.selectCartByMemberId(memId);
		}

		returnMap.put("member", member);
		returnMap.put("averageOrder", averageOrder);
		returnMap.put("onDelivery", onDelivery);
		returnMap.put("onCart", onCart);
		returnMap.put("onRefund", onRefund);
		returnMap.put("cartList", cartList);
		returnMap.put("orderList", orderList);
		returnMap.put("refundList", refundList);

		return returnMap;
	}
	
	@Override
	public Map<String, Object> getMemberStatics() {
		//초기화
		Map<String,Object> viewMap=new HashMap();
		int memberMen,memberWomen,totalMember,totalNonMember=0;
		
		//남자회원수 가져오기
		memberMen=adminMemberMapper.selectAllMemberMen();
		//여자회원수 가져오기
		memberWomen=adminMemberMapper.selectAllMemberWomen();
		totalMember=adminMemberMapper.selectTotalMembers();
		
		
		viewMap.put("memberMen", memberMen);
		viewMap.put("memberWomen", memberWomen);
		viewMap.put("totalMember", totalMember);
		viewMap.put("totalNonMember", totalNonMember);
		return viewMap;
	}
}

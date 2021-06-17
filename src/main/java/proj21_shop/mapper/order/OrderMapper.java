package proj21_shop.mapper.order;

import java.util.List;

import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;

public interface OrderMapper {
	
	/* 제품 상세 보기 페이지에서 주문하기 버튼 클릭시 마지막 카트번호 검색 */
	int selectLastCartNum();
	
	/*주문완료 후 주문 상세 페이지*/
	int selectLastOrderNum();
	
	/* 제품 주문시 주소 검색 */
	AddressDTO selectAddress(AddressDTO addressDTO);
	
	/* 제품 수량 체크 */
	ProductDTO selectProdByProNum(int proNum);
	
	/* 제품 주문 */
	int insertOrder(List<OrderDTO> orderDTO);

	/* 제품 주문 후 회원 포인트 변경, 누적 사용액 변경, 누적 주문수 변경*/
	int updateMember(MemberDTO memberDTO);
	
	/* 제품 주문시 처음 사용하는 주소가 들어 올때*/
	int insertMemberAddress(AddressDTO addressDTO);
	
	/* 제품 주문후 물건 재고 감소, 누적판매수 증가*/
	int updateProduct(ProductDTO productDTO);
	
	/* 주문 후 주문 된 제품 장바구니 삭제 */
	int deletCart(OrderDTO orderDTO);
}

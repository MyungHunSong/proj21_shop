package proj21_shop.mapper.order;

import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;

public interface OrderMapper {
	
	/* 제품 주문시 주소 검색 */
	AddressDTO selectAddress(AddressDTO addressDTO);
	
	/* 제품 주문 */
	int insertOrder(OrderDTO orderDTO);

	/* 제품 주문 후 회원 포인트 변경, 누적 사용액 변경, 누적 주문수 변경*/
	int updateMember(MemberDTO memberDTO);
	
	/* 제품 주문시 처음 사용하는 주소가 들어 올때*/
	int insertMemberAddress(AddressDTO addressDTO);
	
	/* 제품 주문후 물건 재고 감소, 누적판매수 증가*/
	int updateProduct(ProductDTO productDTO);
}

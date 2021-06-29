package proj21_shop.service.impl.order;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.exception.ToMuchOrderExeption;
import proj21_shop.mapper.member.MemberMapper;
import proj21_shop.mapper.order.OrderMapper;
import proj21_shop.service.order.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public MemberMapper memberMapper;
	
	@Autowired
	public OrderMapper orderMapper;
	
	/* 기존 회원 정보 set */
	@Override
	public MemberDTO selectById(String id) {
		return memberMapper.selectById(id);
	}
	
	/*주문완료후 주문상세페이지로 이동하기 위해 주문번호 중 마지막 번호를 찾아서 넣어준다.*/
	@Override
	public int selectLastOrderNum() {
		return orderMapper.selectLastOrderNum();
	}
	
	@Override
	@Transactional
	public int trInsertOrder(List<OrderDTO> order) {
		
		System.out.println(order);
		int res = 0;
		
		/* 총 할인 금액 */
		int totalSale = 0;
		
		/*제품 기본 할인된 금액*/
		int pSale = 0;
		
		/*제품 구입시 추가되는 포인트*/
		int plusPoint = 0;
		
		/* orderDTO = {OrderDTO{}, OrderDTO{}, OrderDTO{}} */
		AddressDTO addressDTO = new AddressDTO();
		MemberDTO memberDTO = new MemberDTO();	
		ProductDTO productDTO = new ProductDTO();
				
		for(OrderDTO orderDTO : order) {
			ProductDTO checkProd = orderMapper.selectProdByProNum(orderDTO.getProNum());	
			
			/*제품 기본 할인된 금액 = 제품원래가격*제품할인율*제품수량*0.01 */
			pSale += checkProd.getProPrice()*checkProd.getProSalesrate()*0.01*orderDTO.getOrderProQuantity();
			
			/*제품 구입시 추가되는 포인트 = 제품원래가격 - (제품가격*제품할인율*0.01)*/
			plusPoint += (int)((checkProd.getProPrice()-((int)(checkProd.getProPrice()*checkProd.getProSalesrate())*0.01))*0.01)*orderDTO.getOrderProQuantity();
			
			/* 총 할인 금액 */
			totalSale = orderDTO.getOrderDiscount();
		}
		
		
		for(OrderDTO orderDTO : order) {
			ProductDTO checkProd = orderMapper.selectProdByProNum(orderDTO.getProNum());	
			
			addressDTO.setMemberId(orderDTO.getOrderMemberId());
			addressDTO.setMemberAddr1(orderDTO.getDeliveryAddr1());
			addressDTO.setMemberAddr2(orderDTO.getDeliveryAddr2());
			addressDTO.setMemberAddr3(orderDTO.getDeliveryAddr3());
			
			memberDTO.setMemberId(orderDTO.getOrderMemberId());
			memberDTO.setMemberTotalBuy(orderDTO.getOrderPrice());
			
			if(orderMapper.selectAddress(addressDTO) == null) { 
				   orderMapper.insertMemberAddress(addressDTO); 
			}
			//제품 수량이 주문 수량 보다 많거나 같을때 구입가능
			if(checkProd.getProQuantity() >= orderDTO.getOrderProQuantity()) {
				productDTO.setProQuantity(orderDTO.getOrderProQuantity());
				productDTO.setProSold(checkProd.getProPrice()*orderDTO.getOrderProQuantity());
				productDTO.setProNum(orderDTO.getProNum());
				res += orderMapper.updateProduct(productDTO);
				
			}else {
				throw new ToMuchOrderExeption("죄송합니다 수량이 부족합니다.");
			}
			
			res += orderMapper.deletCart(orderDTO);
		}
		
		System.out.println("총 할인 금액 >> " + totalSale);
		System.out.println("제품 기본 할인된 금액 >> " +pSale);
		System.out.println("제품 구입시 사용한 포인트 >> " +(totalSale-pSale));
		System.out.println("제품 구입시 추가되는 포인트 >> "+ plusPoint);
		System.out.println("수정될 포인트 >> "+ (plusPoint-(totalSale-pSale)) );
		
		memberDTO.setMemberTotalOrder(order.size());
		memberDTO.setMemberPoint(plusPoint-(totalSale-pSale));
		
		orderMapper.updateMember(memberDTO);
		res += orderMapper.insertOrder(order);
		
		return res;
	}

	

	
}

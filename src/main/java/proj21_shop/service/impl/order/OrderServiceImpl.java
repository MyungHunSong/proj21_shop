package proj21_shop.service.impl.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.exception.toMuchOrderExeption;
import proj21_shop.mapper.member.MemberMapper;
import proj21_shop.mapper.order.OrderMapper;
import proj21_shop.mapper.product.ProductListMapper;
import proj21_shop.service.order.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public MemberMapper memberMapper;
	
	@Autowired
	public OrderMapper orderMapper;
	
	@Override
	public MemberDTO selectById(String id) {
		return memberMapper.selectById(id);
	}

	@Override
	@Transactional
	public int trInsertOrder(List<OrderDTO> order) {
		int res = 0;

		/* orderDTO = {OrderDTO{}, OrderDTO{}, OrderDTO{}} */
		AddressDTO addressDTO = new AddressDTO();
		MemberDTO memberDTO = new MemberDTO();	
		ProductDTO productDTO = new ProductDTO();
		for(OrderDTO orderDTO : order) {
			
			ProductDTO checkProd = orderMapper.selectProdByProNum(orderDTO.getProNum());
			System.out.println(checkProd);
			
			addressDTO.setMemberId(orderDTO.getOrderMemberId());
			addressDTO.setMemberAddr1(orderDTO.getDeliveryAddr1());
			addressDTO.setMemberAddr2(orderDTO.getDeliveryAddr2());
			addressDTO.setMemberAddr3(orderDTO.getDeliveryAddr3());
			
			memberDTO.setMemberId(orderDTO.getOrderMemberId());
			memberDTO.setMemberTotalBuy(orderDTO.getOrderPrice());
			memberDTO.setMemberTotalOrder(1);
			memberDTO.setMemberPoint((int)((orderDTO.getOrderPrice()-orderDTO.getOrderDiscount())*0.01));
			
			if(orderMapper.selectAddress(addressDTO) == null) { 
				   orderMapper.insertMemberAddress(addressDTO); 
			}
			//제품 수량이 주문 수량 보다 많을 때만 구입가능
			if(checkProd.getProQuantity() >= orderDTO.getOrderProQuantity()) {
				System.out.println("checkProd >>" +checkProd);
				System.out.println("orderDTO >>" +orderDTO);
				productDTO.setProQuantity(orderDTO.getOrderProQuantity());
				productDTO.setProSold(orderDTO.getOrderPrice());
				productDTO.setProNum(orderDTO.getProNum());
				res += orderMapper.updateProduct(productDTO);
				
			}else {
				System.out.println("checkProd >>" +checkProd);
				System.out.println("orderDTO >>" +orderDTO);
				throw new toMuchOrderExeption("죄송합니다 제품 수량이 부족합니다.");
			}
			
			res += orderMapper.deletCart(orderDTO);
			res += orderMapper.updateMember(memberDTO);
			
		}
		
		res += orderMapper.insertOrder(order);
		
		return res;
	}
}

package proj21_shop.service.impl.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_shop.dto.member.AddressDTO;
import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.product.ProductDTO;
import proj21_shop.mapper.member.MemberMapper;
import proj21_shop.mapper.order.OrderMapper;
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
	public void trInsertOrder(OrderDTO orderDTO) {
		MemberDTO memberDTO = new MemberDTO();	
		memberDTO.setMemberTotalBuy(orderDTO.getOrderPrice());
		memberDTO.setMemberTotalOrder(1);
		memberDTO.setMemberPoint((int)(orderDTO.getOrderPrice()*0.01));
		
		AddressDTO addressDTO = new AddressDTO();
		addressDTO.setMemberId(orderDTO.getOrderMemberId());
		addressDTO.setMemberAddr1(orderDTO.getDeliveryAddr1());
		addressDTO.setMemberAddr2(orderDTO.getDeliveryAddr2());
		addressDTO.setMemberAddr3(orderDTO.getDeliveryAddr3());
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProQuantity(orderDTO.getOrderProQuantity());
		productDTO.setProSold(orderDTO.getOrderPrice());
		productDTO.setProNum(orderDTO.getOrderProNum());
		
		orderMapper.insertOrder(orderDTO);
		orderMapper.updateMember(memberDTO);
		
		if(orderMapper.selectAddress(addressDTO) != null) {
			orderMapper.insertMemberAddress(addressDTO);
		}
		
		orderMapper.updateProduct(productDTO);
	}
}

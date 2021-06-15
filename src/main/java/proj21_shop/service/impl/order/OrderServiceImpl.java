package proj21_shop.service.impl.order;

import java.util.ArrayList;
import java.util.List;

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
	public int trInsertOrder(OrderDTO orderDTO) {
		
		int res = 0;
		
		AddressDTO addressDTO = new AddressDTO();
		addressDTO.setMemberId(orderDTO.getOrderMemberId());
		addressDTO.setMemberAddr1(orderDTO.getDeliveryAddr1());
		addressDTO.setMemberAddr2(orderDTO.getDeliveryAddr2());
		addressDTO.setMemberAddr3(orderDTO.getDeliveryAddr3());

		MemberDTO memberDTO = new MemberDTO();	
		memberDTO.setMemberId(orderDTO.getOrderMemberId());
		memberDTO.setMemberTotalBuy(orderDTO.getOrderPrice());
		memberDTO.setMemberTotalOrder(1);
		memberDTO.setMemberPoint((int)(orderDTO.getOrderPrice()*0.01));
		
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProQuantity(orderDTO.getOrderProQuantity());
		productDTO.setProSold(orderDTO.getOrderPrice());
		productDTO.setProNum(orderDTO.getProNum());
		
		if(orderMapper.selectAddress(addressDTO) == null) { 
			   orderMapper.insertMemberAddress(addressDTO); 
		}
		
		List<OrderDTO> order = new ArrayList<OrderDTO>();
		order.add(orderDTO);
		res += orderMapper.insertOrder(order);
		res += orderMapper.updateMember(memberDTO);
		
		res += orderMapper.updateProduct(productDTO);
		return res;
	}
}

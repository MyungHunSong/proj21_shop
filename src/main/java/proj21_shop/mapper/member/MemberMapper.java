package proj21_shop.mapper.member;

import java.util.List;

import org.springframework.stereotype.Component;


import proj21_shop.dto.member.MemberDTO;

@Component
public interface MemberMapper {

	List<MemberDTO> selectAll();

	MemberDTO selectById(String id);

}

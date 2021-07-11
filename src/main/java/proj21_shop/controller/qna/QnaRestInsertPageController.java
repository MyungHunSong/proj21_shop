package proj21_shop.controller.qna;

import java.io.File;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.dto.order.OrderDTO;
import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.service.order.MyOrderService;
import proj21_shop.service.qna.QnaInsertService;

@RestController
@RequestMapping("/api")
public class QnaRestInsertPageController {
	
	
	@Autowired
	QnaInsertService qInsertService;
	
	// 식별자를 통한 수정 버튼 -> 수정페이지
	@GetMapping("/qnainsert/{idx}")
	public ResponseEntity<Object> selectWhereIdxForModify(@PathVariable int idx, HttpSession session, ModelAndView mav){
		session.setAttribute("idx", idx);
		
		return ResponseEntity.ok(qInsertService.selectWhereIndexForModify(idx));
	}
	// 회원일시 내 qna 작성하기.
	@PostMapping("/qnainsert/")
	public ResponseEntity<Object> InsertQnaForMember(@RequestBody QnaDTO qDto){
		try {
			qInsertService.insertQnaForMember(qDto);
			
			URI uri = URI.create("/api/qnainsert" + qDto.getqIndex());
			return ResponseEntity.created(uri).body(qDto.getqIndex());
		}catch(Exception e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxActionPost(MultipartFile[] uploadFile, HttpServletRequest request) {

		String upload = request.getSession().getServletContext().getRealPath("/");
		
		String imgUploadPath = upload +"resources"+ File.separator + "qna" + File.separator +"upload";
		System.out.println(imgUploadPath);
		for(MultipartFile multipartFile : uploadFile) {
			// 파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//") + 1); 
			
			File saveFile = new File(imgUploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
	}
	// 내글 수정 restful
	@PatchMapping("/qnainsert/{qIndex}")
	public ResponseEntity<Object> ModfiyQnaForMember(@RequestBody QnaDTO qDto){
		
		return ResponseEntity.ok(qInsertService.modifyQnaForMember(qDto));
	}
	
	@DeleteMapping("/qnaDelete")
	public ResponseEntity<Object> DeleteQnaForMember(@RequestBody QnaDTO qDto){
		return ResponseEntity.ok(qInsertService.deleteQnaForMember(qDto));
		
	}
	// Myorder Page 에서 끌어와서 쓰는것.	
	@Autowired
	private MyOrderService myOrderService;
	
	// 내 주문내역을 조회하기 위해서 가져온것이다.
	@GetMapping("/qnaMyOrder/{qMem}")
	public ResponseEntity<Object> selectMyQnaOrder(@PathVariable String qMem, HttpSession session){
		session.setAttribute("qMem", qMem);
		
		return ResponseEntity.ok(myOrderService.selectOrderByMember(qMem));
	}
	
	// order 페이지에서 쓰넌 것
	@GetMapping("/qnaOrderGet/{memberId}/{orderProNum}")
	public ResponseEntity<Object> selectMyQnaOrderForNum(@PathVariable String memberId, @PathVariable int orderProNum, HttpSession session){
		OrderDTO orderDto = new OrderDTO();
		session.setAttribute("qnaOrderNum", orderProNum);
		orderDto.setMemberId(memberId);
		orderDto.setOrderProNum(orderProNum);
		 
		return ResponseEntity.ok(myOrderService.selectOrderDetailByMember(orderDto));
	}
}

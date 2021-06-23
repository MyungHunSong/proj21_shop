package proj21_shop.controller.qna;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.service.qna.QnaInsertService;

@RestController
@RequestMapping("/api")
public class QnaRestInsertPageController {
	
	@Autowired
	QnaInsertService qInsertService;
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
	
	@PatchMapping("/qnainsert/{qIndex}")
	public ResponseEntity<Object> ModfiyQnaForMember(@RequestBody QnaDTO qDto){
		return ResponseEntity.ok(qInsertService.modifyQnaForMember(qDto));
	}
	
	@DeleteMapping("/qnainsert/{qIndex}")
	public ResponseEntity<Object> DeleteQnaForMember(@RequestBody QnaDTO qDto){
		return ResponseEntity.ok(qInsertService.deleteQnaForMember(qDto));
	}
}

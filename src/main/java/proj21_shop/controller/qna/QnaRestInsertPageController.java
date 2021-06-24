package proj21_shop.controller.qna;

import java.io.File;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import proj21_shop.dto.qna.QnaDTO;
import proj21_shop.service.qna.QnaInsertService;

@RestController
@RequestMapping("/api")
public class QnaRestInsertPageController {
	private static final String CURR_IMAGE_UPLOAD_PATH = "C:\\workspace_web\\proj21_shop\\src\\main\\webapp\\resources\\qna\\upload";
	
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
	
	/* 첨부 파일 업로드 */
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxActionPost(MultipartFile[] uploadFile, HttpServletRequest request) {
		
		String upload = request.getSession().getServletContext().getRealPath("/");
		String imgUploadPath = upload +"resources"+ File.separator + "qna" + File.separator +"upload";
		
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
	
	@PatchMapping("/qnainsert/{qIndex}")
	public ResponseEntity<Object> ModfiyQnaForMember(@RequestBody QnaDTO qDto){
		return ResponseEntity.ok(qInsertService.modifyQnaForMember(qDto));
	}
	
	@DeleteMapping("/qnainsert/{qIndex}")
	public ResponseEntity<Object> DeleteQnaForMember(@RequestBody QnaDTO qDto){
		return ResponseEntity.ok(qInsertService.deleteQnaForMember(qDto));
		
	}
}

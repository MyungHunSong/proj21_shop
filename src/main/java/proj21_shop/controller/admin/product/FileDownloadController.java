package proj21_shop.controller.admin.product;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static final String CURR_IMAGE_REPO_PATH="D:\\shop\\file_repo";
	private static final String CURR_NOTICE_REVIEW_REPO_PATH="D:\\shop\\notice\\review";
	private static final String CURR_NOTICE_QNA_REPO_PATH="D:\\shop\\notice\\qna";
	
	@RequestMapping("/thumbnails")
	protected void thumbnails(@RequestParam(value="fileName", required=false) String fileName,
							  @RequestParam(value="proNum", required=false)	String proNum,
							  @RequestParam(value="reviewNum", required=false) String review_num,
							  @RequestParam(value="qIndex" , required=false) String q_index,
							  HttpServletResponse response) throws IOException{
		
		OutputStream out=response.getOutputStream();
//		System.out.println("fileName ------이미지이미지"+fileName);
//		System.out.println("review_num ------이미지이미지"+review_num);
	
//		System.out.println("ThumbNail 신호");
		String filePath;
		if(proNum !=null && !proNum.equals("")) {
			filePath=CURR_IMAGE_REPO_PATH+"\\"+proNum+"\\"+fileName;
		}
		else if (review_num != null && !review_num.equals("")){
			filePath=CURR_NOTICE_REVIEW_REPO_PATH+"\\"+review_num+"\\"+fileName;
		}else {
			filePath=CURR_NOTICE_QNA_REPO_PATH+"\\"+q_index+"\\"+fileName;
		}
		
		
		File image=new File(filePath);
		int lastIndex=fileName.lastIndexOf(".");
		String imageFileName=fileName.substring(0,lastIndex);
		if(image.exists()) {
			Thumbnails.of(image).size(666,999).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer =new byte[1024*8];
		out.write(buffer);
		out.close();
								  
	  }
}

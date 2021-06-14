package proj21_shop.controller.admin.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.dto.member.MemberDTO;
import proj21_shop.dto.product.ProductImageDTO;
import proj21_shop.service.admin.product.AdminProductService;

@Controller("adminProductController")
@RequestMapping("/admin/product/")
public class AdminProductController {
	private static final String CURR_IMAGE_REPO_PATH="C:\\codename\\file_repo";
	
	@Autowired
	AdminProductService adminProductService;

	@RequestMapping("listProducts")
	public ModelAndView addNewProductMain(
			@RequestParam(value = "total", required = false) String total,
			@RequestParam(value = "proName", required = false) String keyword,
			@RequestParam(value = "proStatus", required = false) String proStatus,
			@RequestParam(value = "proCategory", required = false) String proCategory,
			@RequestParam(value = "proPrice", required = false) String proPrice,
			@RequestParam(value = "proSalesRate", required = false) String proSalesRate,
			@RequestParam(value = "proHits", required = false) String proHits,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		if(session.getAttribute("side_menu") !=null){
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_product");
		
		System.out.println("RequestParam==keyword :"+keyword);
		System.out.println("RequestParam==proStatus :"+proStatus);
		System.out.println("RequestParam==proCategory :"+proCategory);
		System.out.println("RequestParam==proPrice :"+proPrice);
		System.out.println("RequestParam==proSalesRate :"+proSalesRate);
		System.out.println("RequestParam==proHits :"+proHits);
		
		ModelAndView mav = new ModelAndView();
		

		Map<String,Object> pagingMap=new HashMap(); 
		Map<String,Object> productsMap=new HashMap(); 
		String _section=(String)request.getParameter("section"); 
		String _pageNum=(String)request.getParameter("pageNum"); 
		
		int section=Integer.parseInt(((_section==null) ?"1" : _section)); 
		int pageNum=Integer.parseInt(((_pageNum==null) ?"1" : _pageNum)); 
		
		
		pagingMap.put("section", section); 
		pagingMap.put("pageNum", pageNum); 
		pagingMap.put("total", total); 
		pagingMap.put("keyword", keyword); 
		pagingMap.put("proStatus", proStatus); 
		pagingMap.put("proCategory", proCategory); 
		pagingMap.put("proPrice", proPrice); 
		pagingMap.put("proSalesRate", proSalesRate);
		pagingMap.put("proHits", proHits); 
		
		productsMap=adminProductService.listProducts(pagingMap);
		System.out.println("key : " + productsMap.get("productsList"));
		
		productsMap.put("section", section); 
		productsMap.put("pageNum", pageNum); 
		productsMap.put("keyword", keyword); 
		productsMap.put("proCategory", proCategory); 
		productsMap.put("proPrice", proPrice); 
		productsMap.put("proSalesRate", proSalesRate); 
		productsMap.put("proHits", proHits); 
		productsMap.put("proStatus", proStatus); 
		
		System.out.println("productsMap :section="+section );
		System.out.println("productsMap :pageNum="+pageNum );
		System.out.println("productsMap :keyword="+keyword );
		System.out.println("productsMap :proCategory="+proCategory );
		System.out.println("productsMap :proPrice="+proPrice );
		System.out.println("productsMap :proSalesRate="+proSalesRate );
		System.out.println("productsMap :proHits="+proHits );
		System.out.println("productsMap :proStatus="+proStatus );
		
		mav.addObject("productsMap",productsMap);
		mav.setViewName("admin/product/listProducts");
		
		return mav;
	}
	@RequestMapping(value="addNewProduct", method=RequestMethod.POST)
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		Map<String,Object> newProductMap=new HashMap();
		
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newProductMap.put(name, value);
		}
		
		HttpSession session=multipartRequest.getSession();
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("memberInfo");
 		String register=memberDTO.getMemberId();
 		
 		List<ProductImageDTO> imageFileList=upload(multipartRequest);
//		if(imageFileList !=null && imageFileList.size() !=0) { //null check
//			for(ProductImageDTO productImageDTO : imageFileList) {
//				productImageDTO.setProRegister(register); 
//			}
//			newProductMap.put("imageFileList", imageFileList);
//		}
		String message=null;
		ResponseEntity resEntity=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int pro_code=adminProductService.addNewProduct(newProductMap); 
			if(imageFileList !=null && imageFileList.size() !=0) {
				for(ProductImageDTO productImageDTO : imageFileList) {
				imageFileName=productImageDTO.getProImagefilename();
				File srcFile=new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
				File destDir=new File(CURR_IMAGE_REPO_PATH+"\\"+pro_code);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message="<script> ";
			message+=" alert('새상품이 등록외었습니다.');";
			message+=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewProductForm';";
			message+=" </script>";
			
		}catch(Exception e) {
			e.printStackTrace();
			if(imageFileList !=null && imageFileList.size() !=0) {
				for(ProductImageDTO productImageDTO : imageFileList) {
					imageFileName=productImageDTO.getProImagefilename();
					File srcFile=new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message="<script> ";
			message+=" alert('새상품 들록 실패');";
			message+=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewProductForm';";
			message+=" </script>";
		}
		resEntity=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
		return resEntity;
	}

	@RequestMapping("addNewProductForm")
	public ModelAndView addNewProductForm(
			HttpServletResponse response, HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/product/addNewProductForm");
		return mav;
	}
	private List<ProductImageDTO> upload(MultipartHttpServletRequest multipartRequest) throws IOException {
		List<ProductImageDTO> fileList= new ArrayList<ProductImageDTO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			ProductImageDTO productImageDTO =new ProductImageDTO();
			String fileName = fileNames.next();
			productImageDTO.setProImgState(Integer.valueOf(fileName));
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			productImageDTO.setProImagefilename(originalFileName);
			fileList.add(productImageDTO);
			
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){ 
							file.createNewFile(); 
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+"temp"+ "\\"+originalFileName));
			}
		}
		return fileList;
	}
	

}

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.dto.product.ProductImageDTO;
import proj21_shop.service.admin.product.AdminProductService;

@Controller("adminProductController")
@RequestMapping("/admin/product/")
public class AdminProductController {
	private static final String CURR_IMAGE_REPO_PATH = "D:\\codename\\file_repo";

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
			@RequestParam(value = "proSold", required = false) String proSold,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_product");

		System.out.println("RequestParam==keyword :" + keyword);
		System.out.println("RequestParam==proStatus :" + proStatus);
		System.out.println("RequestParam==proCategory :" + proCategory);
		System.out.println("RequestParam==proPrice :" + proPrice);
		System.out.println("RequestParam==proSalesRate :" + proSalesRate);
		System.out.println("RequestParam==proHits :" + proHits);

		ModelAndView mav = new ModelAndView();

		Map<String, Object> pagingMap = new HashMap();
		
		Map<String, Object> productsMap = new HashMap();
		
		String _section = (String) request.getParameter("section");
		String _pageNum = (String) request.getParameter("pageNum");

		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("total", total);
		pagingMap.put("keyword", keyword);
		pagingMap.put("proStatus", proStatus);
		pagingMap.put("proCategory", proCategory);
		pagingMap.put("proPrice", proPrice);
		pagingMap.put("proSalesRate", proSalesRate);
		pagingMap.put("proHits", proHits);

		productsMap = adminProductService.listProducts(pagingMap);
		System.out.println("key : " + productsMap.get("productsList"));
		productsMap.put("section", section);
		productsMap.put("pageNum", pageNum);
		productsMap.put("keyword", keyword);
		productsMap.put("proSold", proSold);
		
		productsMap.put("proCategory", proCategory);
		productsMap.put("proPrice", proPrice);
		productsMap.put("proSalesRate", proSalesRate);
		productsMap.put("proHits", proHits);
		productsMap.put("proStatus", proStatus);

		System.out.println("productsMap :section=" + section);
		System.out.println("productsMap :pageNum=" + pageNum);
		System.out.println("productsMap :keyword=" + keyword);
		System.out.println("productsMap :proSold=" + proSold);
		System.out.println("productsMap :proCategory=" + proCategory);
		System.out.println("productsMap :proPrice=" + proPrice);
		System.out.println("productsMap :proSalesRate=" + proSalesRate);
		System.out.println("productsMap :proHits=" + proHits);
		System.out.println("productsMap :proStatus=" + proStatus);

		mav.addObject("productsMap", productsMap);
		mav.setViewName("admin/product/listProducts");

		return mav;
	}

	@RequestMapping(value = "addNewProduct", method = RequestMethod.POST)
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName = null;
		Map<String, Object> newProductMap = new HashMap();
		Map<String, Object> newProductMap2 = new HashMap();

		System.out.println(multipartRequest.getParameter("proCategory"));
		System.out.println(multipartRequest.getParameter("proNum"));
		System.out.println(multipartRequest.getParameter("proName"));
		System.out.println(multipartRequest.getParameter("proContent"));
		System.out.println(multipartRequest.getParameter("proQuantity"));
		System.out.println(multipartRequest.getParameter("proSize"));
		System.out.println(multipartRequest.getParameter("proColor"));
		System.out.println(multipartRequest.getParameter("proSalesrate"));
		System.out.println(multipartRequest.getParameter("proPrice"));
		System.out.println(multipartRequest.getParameter("proStatus"));

		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newProductMap2.put(name, value);
		}

		

		List<ProductImageDTO> imageFileList = upload(multipartRequest);
		
		newProductMap.put("imageFileList", imageFileList);
//		if(imageFileList !=null && imageFileList.size() !=0) { //null check
//			for(ProductImageDTO productImageDTO : imageFileList) {
//				productImageDTO.setProRegister(register); 
//			}
//			newProductMap.put("imageFileList", imageFileList);
//		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			newProductMap.put("proContent", multipartRequest.getParameter("proContent"));
			newProductMap.put("proStatus", multipartRequest.getParameter("proStatus"));
			newProductMap.put("proName", multipartRequest.getParameter("proName"));
			newProductMap.put("proNum", Integer.parseInt(multipartRequest.getParameter("proNum")));
			newProductMap.put("proCategory", Integer.parseInt(multipartRequest.getParameter("proCategory")));
			newProductMap.put("proQuantity", Integer.parseInt(multipartRequest.getParameter("proQuantity")));
			newProductMap.put("proSize", Integer.parseInt(multipartRequest.getParameter("proSize")));
			newProductMap.put("proColor", Integer.parseInt(multipartRequest.getParameter("proColor")));
			newProductMap.put("proSalesrate", Integer.parseInt(multipartRequest.getParameter("proSalesrate")));
			newProductMap.put("proPrice", Integer.parseInt(multipartRequest.getParameter("proPrice")));
			adminProductService.addNewProduct(newProductMap);
			String proNum = multipartRequest.getParameter("proNum");
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ProductImageDTO productImageDTO : imageFileList) {
					imageFileName = productImageDTO.getProImagefilename();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + proNum);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script> ";
			message += " alert('새상품이 등록외었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/product/addNewProductForm';";
			message += " </script>";

		} catch (Exception e) {
			e.printStackTrace();
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ProductImageDTO productImageDTO : imageFileList) {
					imageFileName = productImageDTO.getProImagefilename();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script> ";
			message += " alert('새상품 등록 실패');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/product/addNewProductForm';";
			message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEntity;
	}

	@RequestMapping("addNewProductForm")
	public ModelAndView addNewProductForm(HttpServletResponse response, HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/addNewProductForm");
		return mav;
	}

	private List<ProductImageDTO> upload(MultipartHttpServletRequest multipartRequest) throws IOException {

		Iterator fileNames2 = multipartRequest.getFileNames();
		while (fileNames2.hasNext()) {
			String fileName = (String) fileNames2.next(); // 파일 네임
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename(); // 오리지널 파일 네임
			System.out.println("originalFileName>>=" + originalFileName);
		}

		List<ProductImageDTO> fileList = new ArrayList<ProductImageDTO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			ProductImageDTO productImageDTO = new ProductImageDTO();

			String fileName = fileNames.next();
			System.out.println("fileName>>>>>>>>>>>>>" + fileName);
			productImageDTO.setProImgState(Integer.parseInt(fileName));

			MultipartFile mFile = multipartRequest.getFile(fileName);

			System.out.println("mFile>>>>>>>>>>>>>" + mFile.getName());
			System.out.println("mFile>>>>>>>>>>>>>" + mFile.getContentType());
			String originalFileName = mFile.getOriginalFilename();

			productImageDTO.setProImagefilename(originalFileName);
			System.out.println("originalFileName>>>>>>>>>>>>>" + originalFileName);
			fileList.add(productImageDTO);
			System.out.println("fileList>>>>>>>>>>>>>" + fileList);

			
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			System.out.println(file.getPath());
			if (mFile.getSize() != 0) {
				System.out.println("mFile.getSize()============="+mFile.getSize());
				System.out.println("!file.exists()======="+!file.exists());
				System.out.println("file.getParentFile()========="+file.getParentFile());
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
			}
		}
		return fileList;
	}
	
	@RequestMapping(value="upModel", method= RequestMethod.POST)
	public ResponseEntity upModel(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String,Object> productMap=new HashMap();
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			productMap.put(name, value);
		}
		ProductDTO product = new ProductDTO();
		
		product.setProNum(Integer.parseInt(request.getParameter("proNum")));
		System.out.println("proNum================="+request.getParameter("proNum"));
		product.setProQuantity(Integer.parseInt(request.getParameter("proQuantity")));
		System.out.println("proQuantity================="+request.getParameter("proQuantity"));
		
		adminProductService.modifyModel(product);
		
		String message=null;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		message="<script> ";
		message+=" alert('모델 추가가 완료되었습니다.');";
		message+=" self.close();";
		message+=" opener.parent.location.reload();";
		message+=" </script>";
		
		resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
		return resEnt;
	}
	@RequestMapping("upModelForm")
	public ModelAndView addNewModelForm(@RequestParam(value="proNum") String proNum,
			  @RequestParam(value="proCategory") String proCategory,
			  @RequestParam(value="proColor") String proColor,
			  @RequestParam(value="proSize") String proSize,
			  HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("proNum",proNum);
		mav.addObject("proCategory",proCategory);
		mav.addObject("proColor",proColor);
		mav.addObject("proSize",proSize);
		mav.setViewName("admin/product/upModelForm");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteProducts", method= RequestMethod.POST)
	public ResponseEntity deleteProducts(String[] _delete_val,
									HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<String> deleteList=new ArrayList<String>();
		for(String value : _delete_val) { //삭제할 제품 번호 리스트에 추가
			System.out.println(value);
			deleteList.add(value);
		}
		String message=null;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		Map<String,Object> deleteMap=new HashMap();
		deleteMap.put("deleteList", deleteList);
		try {
			adminProductService.deleteProducts(deleteMap);
			//이미지 파일 삭제
			for(int i=0; i<deleteList.size(); i++) {
				File destDir=new File(CURR_IMAGE_REPO_PATH+"\\"+deleteList.get(i).toString());
				FileUtils.deleteDirectory(destDir);
			}
			message="<script> ";
			message+=" alert('선택한 제품 삭제를 완료하였습니다.');";
			message+=" location.href='"+request.getContextPath()+"/admin/product/listProducts'; ";
			message+=" </script>";
			resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}catch(Exception e) {
			
			message="<script> ";
			message+=" alert('제품 삭제를 실패하셨습니다..');";
			message+=" location.href='"+request.getContextPath()+"/admin/product/listProducts'; ";
			message+=" </script>";
			resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@RequestMapping("productStatics")
	public ModelAndView productStatics (HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String,Object> viewMap=adminProductService.getProductStatics();
		
		mav.addObject("viewMap",viewMap);
		mav.setViewName("admin/product/productStatics");
		return mav;
	}
}

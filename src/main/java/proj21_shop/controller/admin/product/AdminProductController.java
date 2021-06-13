package proj21_shop.controller.admin.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_shop.service.admin.product.AdminProductService;

@Controller("adminProductController")
@RequestMapping("/admin/product/")
public class AdminProductController {

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

}

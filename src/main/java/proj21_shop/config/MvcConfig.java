package proj21_shop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import proj21_shop.interceptor.AdminCheckInterceptor;
import proj21_shop.interceptor.AuthCheckInterceptor;

//view용
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

	/* DispatcherServlet의 매핑경로를 '/' 주었을 때, JSP/HTML/CSS 등을 올바르게 처리하기 위한 설정 추가 */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	/* JSP를 통해서 컨트롤러의 실행 결과를 보여주기 위한 설정 */
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
		registry.order(2);
	}
	

	/* 메인으로 바로 보내기*/
//	@Override
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/include/main").setViewName("main");
//	}
	
	/* 인터셉터 사용 이유?
	 * 1. 특정 url 진입 시 로그인이 된(인가된) 사용자가 접근 해야함.
	 * 2. 특정 url 진입 시 Jwt와 같은 토큰을 검사해야 함
	 * 3. 특정 url의 경우 계정의 권한에 따라 접근을 막아야 함(물론 view 단에서도 처리 가능) */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/cart/**");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/order/**");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/mypage/**");
		registry.addInterceptor(adminCheckInterceptor()).addPathPatterns("/admin/**");
	}

	private HandlerInterceptor adminCheckInterceptor() {
		return new AdminCheckInterceptor();
}

	@Bean
	public HandlerInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(52428800);
		multipartResolver.setMaxInMemorySize(52428800);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}
	
	/* tile 경로*/
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		// 해당 경로에 tiles.xml 파일을 넣음
		configurer.setDefinitions(new String[] { "/WEB-INF/tiles/*.xml" });
		configurer.setCheckRefresh(true);
		return configurer;
	}

	/* tile resolver*/
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		tilesViewResolver.setOrder(1);
		return tilesViewResolver;
	}
	
	// fileupload 어노테이션.
	@Bean
	public MultipartResolver multipartResolver1() {
		StandardServletMultipartResolver resolver = new StandardServletMultipartResolver();
		return resolver;
	}
}

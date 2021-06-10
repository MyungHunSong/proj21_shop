package proj21_shop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

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
	

//	/* 메인으로 바로 보내기*/
//	@Override
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/include/main").setViewName("main");
//	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/cart/**");
	}

	@Bean
	public HandlerInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
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
}

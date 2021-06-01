package proj21_shop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class, MvcConfig.class})
@ComponentScan(basePackages = {
	    "proj21_shop.service"
	  , "proj21_shop.controller.member"
		})
public class ContextRoot {
	
}

package proj21_shop.controller.order;


import java.util.Collection;

import javax.validation.Validation;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.SpringValidatorAdapter;

/*Collection 타입인 객체를 vaild 하기 위해 생성*/
@Component
public class CustomCollectionValidator implements Validator {
		
        private SpringValidatorAdapter validator;

        public CustomCollectionValidator() {
            this.validator = new SpringValidatorAdapter(
                    Validation.buildDefaultValidatorFactory().getValidator()
            );
        }

        @Override
        public boolean supports(Class clazz) {
            return Collection.class.isAssignableFrom(clazz);
        }

        @Override
        public void validate(Object target, Errors errors) {
           
        	/*기존의 validation도 vaild가능하게한다.*/
        	if(target instanceof Collection){
                Collection collection = (Collection) target;

                for (Object object : collection) {
                    validator.validate(object, errors);
                }
            } else {
                validator.validate(target, errors);
            }

        }

}

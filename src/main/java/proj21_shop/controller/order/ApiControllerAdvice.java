package proj21_shop.controller.order;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ApiControllerAdvice {
	/*@valid 를 이용해 @RequestBody 객체 검증*/
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<Map<String, String>> handleValidationExcetions(MethodArgumentNotValidException ex){
		Map<String, String> errors = new HashMap<String, String>();
		ex.getBindingResult().getAllErrors()
          	.forEach(c -> errors.put(((FieldError) c).getField(), c.getDefaultMessage()));
		return ResponseEntity.badRequest().body(errors);
	}
}

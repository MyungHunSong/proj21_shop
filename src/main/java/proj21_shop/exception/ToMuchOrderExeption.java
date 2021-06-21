package proj21_shop.exception;

@SuppressWarnings("serial")
public class ToMuchOrderExeption extends RuntimeException {

	
	public ToMuchOrderExeption(String message) {
		super(message);
	}
}

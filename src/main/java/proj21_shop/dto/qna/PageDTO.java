package proj21_shop.dto.qna;

public class PageDTO {
	private Integer displayRowCount = 10; // 출력할 갯수
	private Integer rowStart; // 시작행번호
	private Integer rowEnd; // 종료번호
	private Integer totPage; // 전체페이지
	private Integer totRow = 0; // 전체페이지 수
	private Integer page; // 현재페이지
	private Integer pageStart; // 시작페이지
	private Integer pageEnd; // 종료페이지
}

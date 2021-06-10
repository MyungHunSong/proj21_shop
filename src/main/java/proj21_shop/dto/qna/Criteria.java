package proj21_shop.dto.qna;
// 검색기준 dto

public class Criteria {
		private int page;
	    private int perPageNum;
	    private QnaDTO qOp;
	    
	    public QnaDTO getqOp() {
			return qOp;
		}

		public void setqOp(QnaDTO qOp) {
			this.qOp = qOp;
		}

		public Criteria() {
	        this.page = 1;
	        this.perPageNum = 10;
	    }

	    public void setPage(int page) {

	        if (page <= 0) {
	            this.page = 1;
	            return;
	        }

	        this.page = page;
	    }

	    public int getPage() {
	        return page;
	    }

	    public void setPerPageNum(int perPageNum) {

	        if (perPageNum <= 0 || perPageNum > 100) {
	            this.perPageNum = 10;
	            return;
	        }

	        this.perPageNum = perPageNum;
	    }

	    public int getPerPageNum() {
	        return this.perPageNum;
	    }

	    public int getPageStart() {
	        return (this.page - 1) * perPageNum;
	    }

		@Override
		public String toString() {
			return String.format("Criteria [page=%s, perPageNum=%s]", page, perPageNum);
		}
}

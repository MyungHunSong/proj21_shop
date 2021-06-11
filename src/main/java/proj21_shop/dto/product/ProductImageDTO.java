package proj21_shop.dto.product;

public class ProductImageDTO {
	
	private int proNum;
	private int proImgCode;
	private String proImagefilename;
	private int proImgState;

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public int getProImgCode() {
		return proImgCode;
	}

	public void setProImgCode(int proImgCode) {
		this.proImgCode = proImgCode;
	}

	public String getProImagefilename() {
		return proImagefilename;
	}

	public void setProImagefilename(String proImagefilename) {
		this.proImagefilename = proImagefilename;
	}

	public int getProImgState() {
		return proImgState;
	}

	public void setProImgState(int proImgState) {
		this.proImgState = proImgState;
	}

	@Override
	public String toString() {
		return String.format("ProductImageDTO [proNum=%s, proImgCode=%s, proImagefilename=%s, proImgState=%s]", proNum,
				proImgCode, proImagefilename, proImgState);
	}

}

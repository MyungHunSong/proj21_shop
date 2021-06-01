package proj21_shop.dto.product;

import java.util.List;

public class ProductImageDTO {
	
	private List<ProductDTO> proNum;
	private int proImgCode;
	private String proImagefilename;
	private String proImgState;

	public List<ProductDTO> getProNum() {
		return proNum;
	}

	public void setProNum(List<ProductDTO> proNum) {
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

	public String getProImgState() {
		return proImgState;
	}

	public void setProImgState(String proImgState) {
		this.proImgState = proImgState;
	}

	@Override
	public String toString() {
		return String.format("ProductImageDTO [proNum=%s, proImgCode=%s, proImagefilename=%s, proImgState=%s]", proNum,
				proImgCode, proImagefilename, proImgState);
	}

}

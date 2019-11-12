package camp.model.vo;

import java.io.Serializable;

public class CampMinPrice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3130712989315033591L;
	private int cCode; // 캠핑장 코드
	private int cMinPrice; // 캠핑장 자리 중 가장 싼값
	
	public CampMinPrice(int cCode, int cMinPrice) {
		this.cCode = cCode;
		this.cMinPrice = cMinPrice;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public int getcMinPrice() {
		return cMinPrice;
	}

	public void setcMinPrice(int cMinPrice) {
		this.cMinPrice = cMinPrice;
	}

	@Override
	public String toString() {
		return "CampMinPrice [cCode=" + cCode + ", cMinPrice=" + cMinPrice + "]";
	}
	
	
	
}

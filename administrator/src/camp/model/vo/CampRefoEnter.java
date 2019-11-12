package camp.model.vo;

public class CampRefoEnter {
	
	private int cCode; // 캠핑장 코드

	private String sType; // 사이트 타입
	private String reSiType; // 실제 입장사이트
	private int sPrice; // 사이트가격
	private int addPrice; // 추가인원 인당 요금
	private int dateMAx; //최대 숙박기간
	private int stayMAx; // 최대 숙박인원

	private String oType; //옵션 타입
	private String reOpType; // 실제 옵션
	private int oPrice; // 옵션가격
	private int opMax1; // 옵션 최대값 1
	private int opMax2; // 옵션 최대값 2
	
	public CampRefoEnter() {}

	public CampRefoEnter(int cCode, String sType, String reSiType, int sPrice, int addPrice, int dateMAx, int stayMAx,
			String oType, String reOpType, int oPrice, int opMax1, int opMax2) {
		super();
		this.cCode = cCode;
		this.sType = sType;
		this.reSiType = reSiType;
		this.sPrice = sPrice;
		this.addPrice = addPrice;
		this.dateMAx = dateMAx;
		this.stayMAx = stayMAx;
		this.oType = oType;
		this.reOpType = reOpType;
		this.oPrice = oPrice;
		this.opMax1 = opMax1;
		this.opMax2 = opMax2;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public String getReSiType() {
		return reSiType;
	}

	public void setReSiType(String reSiType) {
		this.reSiType = reSiType;
	}

	public int getsPrice() {
		return sPrice;
	}

	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}

	public int getAddPrice() {
		return addPrice;
	}

	public void setAddPrice(int addPrice) {
		this.addPrice = addPrice;
	}

	public int getDateMAx() {
		return dateMAx;
	}

	public void setDateMAx(int dateMAx) {
		this.dateMAx = dateMAx;
	}

	public int getStayMAx() {
		return stayMAx;
	}

	public void setStayMAx(int stayMAx) {
		this.stayMAx = stayMAx;
	}

	public String getoType() {
		return oType;
	}

	public void setoType(String oType) {
		this.oType = oType;
	}

	public String getReOpType() {
		return reOpType;
	}

	public void setReOpType(String reOpType) {
		this.reOpType = reOpType;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public int getOpMax1() {
		return opMax1;
	}

	public void setOpMax1(int opMax1) {
		this.opMax1 = opMax1;
	}

	public int getOpMax2() {
		return opMax2;
	}

	public void setOpMax2(int opMax2) {
		this.opMax2 = opMax2;
	}

	@Override
	public String toString() {
		return "CampRefoEnter [cCode=" + cCode + ", sType=" + sType + ", reSiType=" + reSiType + ", sPrice=" + sPrice
				+ ", addPrice=" + addPrice + ", dateMAx=" + dateMAx + ", stayMAx=" + stayMAx + ", oType=" + oType
				+ ", reOpType=" + reOpType + ", oPrice=" + oPrice + ", opMax1=" + opMax1 + ", opMax2=" + opMax2 + "]";
	}
	
	
	

}

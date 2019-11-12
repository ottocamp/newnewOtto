package camp.model.vo;

public class CampRefoSiteEnter {
	
	private String cName; // 캠핑장 이름

	private String sType; // 사이트 타입
	private String reSiType; // 실제 입장사이트
	private int sPrice; // 사이트가격
	private int addPrice; // 추가인원 인당 요금
	private int dateMAx; //최대 숙박기간
	private int stayMAx; // 최대 숙박인원


	public CampRefoSiteEnter() {}


	public CampRefoSiteEnter(String cName, String sType, String reSiType, int sPrice, int addPrice, int dateMAx,
			int stayMAx) {
		super();
		this.cName = cName;
		this.sType = sType;
		this.reSiType = reSiType;
		this.sPrice = sPrice;
		this.addPrice = addPrice;
		this.dateMAx = dateMAx;
		this.stayMAx = stayMAx;
	}


	public String getcName() {
		return cName;
	}


	public void setcName(String cName) {
		this.cName = cName;
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


	@Override
	public String toString() {
		return "CampRefoSiteEnter [cName=" + cName + ", sType=" + sType + ", reSiType=" + reSiType + ", sPrice="
				+ sPrice + ", addPrice=" + addPrice + ", dateMAx=" + dateMAx + ", stayMAx=" + stayMAx + "]";
	}

	
}

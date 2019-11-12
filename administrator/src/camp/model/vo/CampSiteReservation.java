package camp.model.vo;

import java.io.Serializable;

public class CampSiteReservation implements Serializable{
	
	//디테일 - > 예약 폼으로 넘어올 때 쓰기위한 데이터(캠핑장 코드, 사이트 타입~~~~~~~~~)를 끌어오는  vo
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7456929279470324966L;
	private int cCode; // 캠핑장 코드(시퀀스에따른 일련번호.)
	private String sType; // 사이트 타입
	private String reSiType; // 실제 입장사이트
	private int sPrice; // 사이트가격
	private int addPrice; // 추가인원 인당 요금
	private int dateMax; //최대 숙박기간
	private int stayMax; // 최대 숙박인원
	
	public CampSiteReservation() {}

	public CampSiteReservation(int cCode, String sType, String reSiType, int sPrice, int addPrice, int dateMax,
			int stayMax) {
		super();
		this.cCode = cCode;
		this.sType = sType;
		this.reSiType = reSiType;
		this.sPrice = sPrice;
		this.addPrice = addPrice;
		this.dateMax = dateMax;
		this.stayMax = stayMax;
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

	public int getDateMax() {
		return dateMax;
	}

	public void setDateMax(int dateMax) {
		this.dateMax = dateMax;
	}

	public int getStayMax() {
		return stayMax;
	}

	public void setStayMax(int stayMax) {
		this.stayMax = stayMax;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CampSiteReservation [cCode=" + cCode + ", sType=" + sType + ", reSiType=" + reSiType + ", sPrice="
				+ sPrice + ", addPrice=" + addPrice + ", dateMax=" + dateMax + ", stayMax=" + stayMax + "]";
	}
	
	

}

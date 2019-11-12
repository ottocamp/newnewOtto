package camp.model.vo;

import java.io.Serializable;

public class ReservationCamp implements Serializable {
	
	//메인2(상세) - > 예약 폼으로 넘어올 때 쓰기위한 데이터를 끌어오는  vo
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2822477696353048905L;

	private int cNo; // 캠핑장 코드(시퀀스에따른 일련번호.) ----> 수정함

	private String sType; // 사이트 타입
	private String reSiType; // 실제 입장사이트
	private int sPrice; // 사이트가격
	private int addPrice; // 추가인원 인당 요금
	private int dateMax; //최대 숙박기간
	private int stayMax; // 최대 숙박인원

//	private String oType; //옵션 타입
//	private String reOpType; // 실제 옵션
//	private int oPrice; // 옵션가격
//	private int opMax1; // 옵션 최대값 1
//	private int opMax2; // 옵션 최대값 2


	public ReservationCamp() {}

	public ReservationCamp(int cNo) {
		super();
		this.cNo = cNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public ReservationCamp(int cNo, String sType, String reSiType, int sPrice, int addPrice, int dateMax, int stayMax) {
		super();
		this.cNo = cNo;
		this.sType = sType;
		this.reSiType = reSiType;
		this.sPrice = sPrice;
		this.addPrice = addPrice;
		this.dateMax = dateMax;
		this.stayMax = stayMax;
	}

	

	public ReservationCamp(String sType, int sPrice, int addPrice, int dateMax, int stayMax) {
		super();
		this.sType = sType;
		this.sPrice = sPrice;
		this.addPrice = addPrice;
		this.dateMax = dateMax;
		this.stayMax = stayMax;
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

	@Override
	public String toString() {
		return "ReservationCamp [cNo=" + cNo + ", sType=" + sType + ", reSiType=" + reSiType + ", sPrice=" + sPrice
				+ ", addPrice=" + addPrice + ", dateMax=" + dateMax + ", stayMax=" + stayMax
				+ "]";
	}

	



	
}

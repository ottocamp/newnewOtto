package camp.model.vo;

import java.io.Serializable;

public class CampInfoReservation implements Serializable {
	
	//디테일 - > 예약 폼으로 넘어올 때 쓰기위한 데이터(캠핑장 코드, 캠핑장 이름)를 끌어오는  vo
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8682128934077208169L;
	private int cCode; // 캠핑장 코드(시퀀스에따른 일련번호.)
	private String cName; //캠핑장 이름
	
	public CampInfoReservation() {}

	public CampInfoReservation(int cCode, String cName) {
		super();
		this.cCode = cCode;
		this.cName = cName;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	@Override
	public String toString() {
		return "CampInfoReservation [cCode=" + cCode + ", cName=" + cName + "]";
	}
	
	

}

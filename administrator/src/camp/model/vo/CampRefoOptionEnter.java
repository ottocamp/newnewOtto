package camp.model.vo;

import java.io.Serializable;

public class CampRefoOptionEnter implements Serializable{
	
	//디테일 - > 예약 폼으로 넘어올 때 쓰기위한 데이터(캠핑장 코드, 옵션 타입~~~~~~~~~)를 끌어오는  vo

	/**
	 * 
	 */
	private static final long serialVersionUID = 4745547157373437981L;
	private String cName; // 캠핑장 이름
	
	private String oType; //옵션 타입(실옵션 포함)
	private int oPrice; // 옵션가격
	private int opMax1; // 옵션 최대값 1
	private int opMax2; // 옵션 최대값 2
	
	public CampRefoOptionEnter() {}

	public CampRefoOptionEnter(String cName, String oType, int oPrice, int opMax1, int opMax2) {
		super();
		this.cName = cName;
		this.oType = oType;
		this.oPrice = oPrice;
		this.opMax1 = opMax1;
		this.opMax2 = opMax2;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getoType() {
		return oType;
	}

	public void setoType(String oType) {
		this.oType = oType;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CampRefoOptionEnter [cName=" + cName + ", oType=" + oType + ", oPrice=" + oPrice + ", opMax1=" + opMax1 + ", opMax2=" + opMax2 + "]";
	}
	
	


}

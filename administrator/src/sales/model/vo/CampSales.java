package sales.model.vo;

import java.sql.Date;

public class CampSales implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4381488070823722417L;
	private int sUserNo;
	private int sCampCode;
	private String sPayDate;
	private String sPayType;
	private int sCost;
	private String sCampName;
	private String sReDate;
	private String sUserName;
	
	public CampSales(int sUserNo, int sCampCode, String sPayDate, String sPayType, int sCost, String sCampName,
			String sReDate, String sUserName) {
		this.sUserNo = sUserNo;
		this.sCampCode = sCampCode;
		this.sPayDate = sPayDate;
		this.sPayType = sPayType;
		this.sCost = sCost;
		this.sCampName = sCampName;
		this.sReDate = sReDate;
		this.sUserName = sUserName;
	}

	public int getsUserNo() {
		return sUserNo;
	}

	public void setsUserNo(int sUserNo) {
		this.sUserNo = sUserNo;
	}

	public int getsCampCode() {
		return sCampCode;
	}

	public void setsCampCode(int sCampCode) {
		this.sCampCode = sCampCode;
	}

	public String getsPayDate() {
		return sPayDate;
	}

	public void setsPayDate(String sPayDate) {
		this.sPayDate = sPayDate;
	}

	public String getsPayType() {
		return sPayType;
	}

	public void setsPayType(String sPayType) {
		this.sPayType = sPayType;
	}

	public int getsCost() {
		return sCost;
	}

	public void setsCost(int sCost) {
		this.sCost = sCost;
	}

	public String getsCampName() {
		return sCampName;
	}

	public void setsCampName(String sCampName) {
		this.sCampName = sCampName;
	}

	public String getsReDate() {
		return sReDate;
	}

	public void setsReDate(String sReDate) {
		this.sReDate = sReDate;
	}

	public String getsUserName() {
		return sUserName;
	}

	public void setsUserName(String sUserName) {
		this.sUserName = sUserName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CampSales [sUserNo=" + sUserNo + ", sCampCode=" + sCampCode + ", sPayDate=" + sPayDate + ", sPayType="
				+ sPayType + ", sCost=" + sCost + ", sCampName=" + sCampName + ", sReDate=" + sReDate + ", sUserName="
				+ sUserName + "]";
	}
	
	
	
}

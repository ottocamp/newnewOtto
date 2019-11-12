package camp.model.vo;

import java.io.Serializable;

public class CampDetail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5801481509668399842L;
	private int dCdno;
	private int dCode;
	private String dSiteCode;
	private String dSite;
	private int dPrice;
	private int dAddPirce;
	private int dDateMax;
	private int dStayMax;
	private String dReStatus;
	
	public CampDetail(int dCdno, int dCode, String dSiteCode, String dSite, int dPrice, int dAddPirce, int dDateMax,
			int dStayMax, String dReStatus) {
		this.dCdno = dCdno;
		this.dCode = dCode;
		this.dSiteCode = dSiteCode;
		this.dSite = dSite;
		this.dPrice = dPrice;
		this.dAddPirce = dAddPirce;
		this.dDateMax = dDateMax;
		this.dStayMax = dStayMax;
		this.dReStatus = dReStatus;
	}

	public int getdCdno() {
		return dCdno;
	}

	public void setdCdno(int dCdno) {
		this.dCdno = dCdno;
	}

	public int getdCode() {
		return dCode;
	}

	public void setdCode(int dCode) {
		this.dCode = dCode;
	}

	public String getdSiteCode() {
		return dSiteCode;
	}

	public void setdSiteCode(String dSiteCode) {
		this.dSiteCode = dSiteCode;
	}

	public String getdSite() {
		return dSite;
	}

	public void setdSite(String dSite) {
		this.dSite = dSite;
	}

	public int getdPrice() {
		return dPrice;
	}

	public void setdPrice(int dPrice) {
		this.dPrice = dPrice;
	}

	public int getdAddPirce() {
		return dAddPirce;
	}

	public void setdAddPirce(int dAddPirce) {
		this.dAddPirce = dAddPirce;
	}

	public int getdDateMax() {
		return dDateMax;
	}

	public void setdDateMax(int dDateMax) {
		this.dDateMax = dDateMax;
	}

	public int getdStayMax() {
		return dStayMax;
	}

	public void setdStayMax(int dStayMax) {
		this.dStayMax = dStayMax;
	}

	public String getdReStatus() {
		return dReStatus;
	}

	public void setdReStatus(String dReStatus) {
		this.dReStatus = dReStatus;
	}

	@Override
	public String toString() {
		return "CampDetail [dCdno=" + dCdno + ", dCode=" + dCode + ", dSiteCode=" + dSiteCode + ", dSite=" + dSite
				+ ", dPrice=" + dPrice + ", dAddPirce=" + dAddPirce + ", dDateMax=" + dDateMax + ", dStayMax="
				+ dStayMax + ", dReStatus=" + dReStatus + "]";
	}
	
	
	
}

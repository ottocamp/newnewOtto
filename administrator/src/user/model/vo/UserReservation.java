package user.model.vo;

import java.io.Serializable;
import java.util.Date;

public class UserReservation implements Serializable {
	


	/**
	 * 
	 */
	private static final long serialVersionUID = -4188448090240610799L;
	private int reNo;
	private int rpNo;
	private Date paymentDate;
	private String reDate;
	private int reCost;
	private String reStatus;
	private String pamentType;
	private int userNo;
	private int campCode;
	private String campName;
	
	
	public UserReservation() {}


	public UserReservation(int reNo, int rpNo, Date paymentDate, String reDate, int reCost, String reStatus,
			String pamentType, int userNo, int campCode, String campName) {
		super();
		this.reNo = reNo;
		this.rpNo = rpNo;
		this.paymentDate = paymentDate;
		this.reDate = reDate;
		this.reCost = reCost;
		this.reStatus = reStatus;
		this.pamentType = pamentType;
		this.userNo = userNo;
		this.campCode = campCode;
		this.campName = campName;
	}


	public int getReNo() {
		return reNo;
	}


	public void setReNo(int reNo) {
		this.reNo = reNo;
	}


	public int getRpNo() {
		return rpNo;
	}


	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}


	public Date getPaymentDate() {
		return paymentDate;
	}


	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}


	public String getReDate() {
		return reDate;
	}


	public void setReDate(String reDate) {
		this.reDate = reDate;
	}


	public int getReCost() {
		return reCost;
	}


	public void setReCost(int reCost) {
		this.reCost = reCost;
	}


	public String getReStatus() {
		return reStatus;
	}


	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}


	public String getPamentType() {
		return pamentType;
	}


	public void setPamentType(String pamentType) {
		this.pamentType = pamentType;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getCampCode() {
		return campCode;
	}


	public void setCampCode(int campCode) {
		this.campCode = campCode;
	}


	public String getCampName() {
		return campName;
	}


	public void setCampName(String campName) {
		this.campName = campName;
	}


	@Override
	public String toString() {
		return "UserReservation [reNo=" + reNo + ", rpNo=" + rpNo + ", paymentDate=" + paymentDate + ", reDate="
				+ reDate + ", reCost=" + reCost + ", reStatus=" + reStatus + ", pamentType=" + pamentType + ", userNo="
				+ userNo + ", campCode=" + campCode + ", campName=" + campName + "]";
	}

	
	
	

	
	
	
	

}

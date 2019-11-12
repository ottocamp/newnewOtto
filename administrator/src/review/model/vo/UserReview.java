package review.model.vo;

import java.io.Serializable;

public class UserReview implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5611572642293686376L;
	private int reNo;
	private int uNo;
	private String uId;
	private int cCode;
	private String cName;
	private String reDate;
	private String rTitle;
	private String rContent;
	private int rNum ;
	
	public UserReview() {}

	public UserReview(int reNo, int uNo, String uId, int cCode, String cName, String reDate, String rTitle,
			String rContent, int rNum) {
		super();
		this.reNo = reNo;
		this.uNo = uNo;
		this.uId = uId;
		this.cCode = cCode;
		this.cName = cName;
		this.reDate = reDate;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rNum = rNum;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
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

	public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "UserReview [reNo=" + reNo + ", uNo=" + uNo + ", uId=" + uId + ", cCode=" + cCode + ", cName=" + cName
				+ ", reDate=" + reDate + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rNum=" + rNum + "]";
	}
	
	



	
	
	

}

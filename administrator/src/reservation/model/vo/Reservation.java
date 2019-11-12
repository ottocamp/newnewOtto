package reservation.model.vo;

import java.sql.Date;

public class Reservation implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6460490603196531458L;
	private int reNo; // 예약번호
	private Date rePayDate; // 결제일시
	private String reName; // 이름
	private String rePhone; // 연락처
	private String reDate; // 예약일자
	private int reCost; // 결제금액
	private String reStatus; // 처리상태
	private String reCampName; // 사업자명
	
	public Reservation() {}

	public Reservation(int reNo, Date rePayDate, String reName, String rePhone, String reDate, int reCost, String reStatus,
			String reOperName) {
		super();
		this.reNo = reNo;
		this.rePayDate = rePayDate;
		this.reName = reName;
		this.rePhone = rePhone;
		this.reDate = reDate;
		this.reCost = reCost;
		this.reStatus = reStatus;
		this.reCampName = reOperName;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public Date getRePayDate() {
		return rePayDate;
	}

	public void setRePayDate(Date rePayDate) {
		this.rePayDate = rePayDate;
	}

	public String getReName() {
		return reName;
	}

	public void setReName(String reName) {
		this.reName = reName;
	}

	public String getRePhone() {
		return rePhone;
	}

	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
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

	public String getReCampName() {
		return reCampName;
	}

	public void setReCampName(String reCampName) {
		this.reCampName = reCampName;
	}

	@Override
	public String toString() {
		return "Reservation [reNo=" + reNo + ", rePayDate=" + rePayDate + ", reName=" + reName + ", rePhone=" + rePhone
				+ ", reDate=" + reDate + ", reCost=" + reCost + ", reStatus=" + reStatus + ", reCampName=" + reCampName
				+ "]";
	}
	
	
	
	
}

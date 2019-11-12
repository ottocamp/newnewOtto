package coupon.model.vo;

import java.io.Serializable;

public class Coupon implements Serializable{

	/**
	 * 
	 */
	

	private static final long serialVersionUID = -2338447583262703809L;
	private String cCode; // 쿠폰코드
	private String cName; // 쿠폰이름
	private int cDiscount; // 할인금액
	private String cStartDay; // 시작날짜
	private String cEndDay; // 종료날짜
	private String cGrade; // 등급
	private String cStatus; // 상태
	private int Previous; // 지난기간
	private int Remaining; // 남은기간
	private int totalRange; // 전체기간
	private double Progress; // 진행률
	
	
	public Coupon(String cCode, String cName, int cDiscount, String cStartDay, String cEndDay, String cGrade,
			String cStatus, int previous, int remaining, int totalRange, double progress) {
		super();
		this.cCode = cCode;
		this.cName = cName;
		this.cDiscount = cDiscount;
		this.cStartDay = cStartDay;
		this.cEndDay = cEndDay;
		this.cGrade = cGrade;
		this.cStatus = cStatus;
		Previous = previous;
		Remaining = remaining;
		this.totalRange = totalRange;
		Progress = progress;
	}

	public String getcCode() {
		return cCode;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getcDiscount() {
		return cDiscount;
	}

	public void setcDiscount(int cDiscount) {
		this.cDiscount = cDiscount;
	}

	public String getcStartDay() {
		return cStartDay;
	}

	public void setcStartDay(String cStartDay) {
		this.cStartDay = cStartDay;
	}

	public String getcEndDay() {
		return cEndDay;
	}

	public void setcEndDay(String cEndDay) {
		this.cEndDay = cEndDay;
	}

	public String getcGrade() {
		return cGrade;
	}

	public void setcGrade(String cGrade) {
		this.cGrade = cGrade;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public int getPrevious() {
		return Previous;
	}

	public void setPrevious(int previous) {
		Previous = previous;
	}

	public int getRemaining() {
		return Remaining;
	}

	public void setRemaining(int remaining) {
		Remaining = remaining;
	}

	public int getTotalRange() {
		return totalRange;
	}

	public void setTotalRange(int totalRange) {
		this.totalRange = totalRange;
	}

	public double getProgress() {
		return Progress;
	}

	public void setProgress(double progress) {
		Progress = progress;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Coupon [cCode=" + cCode + ", cName=" + cName + ", cDiscount=" + cDiscount + ", cStartDay=" + cStartDay
				+ ", cEndDay=" + cEndDay + ", cGrade=" + cGrade + ", cStatus=" + cStatus + ", Previous=" + Previous
				+ ", Remaining=" + Remaining + ", totalRange=" + totalRange + ", Progress=" + Progress + "]";
	}
	
	
	
	
	
	
	
	
	
}

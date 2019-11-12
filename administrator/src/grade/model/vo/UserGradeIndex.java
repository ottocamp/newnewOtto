package grade.model.vo;

import java.io.Serializable;

public class UserGradeIndex implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 759642435839210538L;
	private int guserNo; // 유저번호
	private String guserName; // 유저이름
	private String gbeforeGrade; // 변경전 등급
	private String gafterGrade; // 변경후 등금
	private int gsumCost; // 총 사용금액
	
	public UserGradeIndex(int guserNo, String guserName, String gbeforeGrade, String gafterGrade, int gsumCost) {
		this.guserNo = guserNo;
		this.guserName = guserName;
		this.gbeforeGrade = gbeforeGrade;
		this.gafterGrade = gafterGrade;
		this.gsumCost = gsumCost;
	}

	public int getGuserNo() {
		return guserNo;
	}

	public void setGuserNo(int guserNo) {
		this.guserNo = guserNo;
	}

	public String getGuserName() {
		return guserName;
	}

	public void setGuserName(String guserName) {
		this.guserName = guserName;
	}

	public String getGbeforeGrade() {
		return gbeforeGrade;
	}

	public void setGbeforeGrade(String gbeforeGrade) {
		this.gbeforeGrade = gbeforeGrade;
	}

	public String getGafterGrade() {
		return gafterGrade;
	}

	public void setGafterGrade(String gafterGrade) {
		this.gafterGrade = gafterGrade;
	}

	public int getGsumCost() {
		return gsumCost;
	}

	public void setGsumCost(int gsumCost) {
		this.gsumCost = gsumCost;
	}

	@Override
	public String toString() {
		return "UserGradeIndex [guserNo=" + guserNo + ", guserName=" + guserName + ", gbeforeGrade=" + gbeforeGrade
				+ ", gafterGrade=" + gafterGrade + ", gsumCost=" + gsumCost + "]";
	}
	
	
	
}

package grade.model.vo;

public class UserGrade implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5553423641803664598L;
	private int guserNo; // 회원 번호
	private String guserName; // 회원 이름
	private String guserGrade; // 회원 등급
	private String gjoinDate; // 가입 일자
	private int gsumCost; // 가입일부터 현재 일시까지 총 결제 금액
	private String gemail; // 이메일 
	
	public UserGrade() {}
	
	
	public UserGrade(int guserNo, String guserId, String guserGrade, String gjoinDate, int gsumCost, String gemail) {
		this.guserNo = guserNo;
		this.guserName = guserId;
		this.guserGrade = guserGrade;
		this.gjoinDate = gjoinDate;
		this.gsumCost = gsumCost;
		this.gemail = gemail;
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

	public String getGuserGrade() {
		return guserGrade;
	}

	public void setGuserGrade(String guserGrade) {
		this.guserGrade = guserGrade;
	}

	public String getGjoinDate() {
		return gjoinDate;
	}

	public void setGjoinDate(String gjoinDate) {
		this.gjoinDate = gjoinDate;
	}

	public int getGsumCost() {
		return gsumCost;
	}

	public void setGsumCost(int gsumCost) {
		this.gsumCost = gsumCost;
	}

	public String getGemail() {
		return gemail;
	}

	public void setGemail(String gemail) {
		this.gemail = gemail;
	}

	@Override
	public String toString() {
		return "UserGrade [guserNo=" + guserNo + ", guserId=" + guserName + ", guserGrade=" + guserGrade + ", gjoinDate="
				+ gjoinDate + ", gsumCost=" + gsumCost + ", gemail=" + gemail + "]";
	}
	
	
	
	
	
}

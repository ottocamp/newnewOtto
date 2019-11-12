package sales.model.vo;

public class CampDaySales {

	private String sDay; // 매출일
	private int sCampCode; // 사업장 코드
	private String sCampName; // 사업장 이름 
	private int sCost; // 매출액
	private int sCount; // 매출건수 
	
	public CampDaySales(String sDay, int sCampCode, String sCampName, int sCost, int sCount) {
		this.sDay = sDay;
		this.sCampCode = sCampCode;
		this.sCampName = sCampName;
		this.sCost = sCost;
		this.sCount = sCount;
	}

	public String getsDay() {
		return sDay;
	}

	public void setsDay(String sDay) {
		this.sDay = sDay;
	}

	public int getsCampCode() {
		return sCampCode;
	}

	public void setsCampCode(int sCampCode) {
		this.sCampCode = sCampCode;
	}

	public String getsCampName() {
		return sCampName;
	}

	public void setsCampName(String sCampName) {
		this.sCampName = sCampName;
	}

	public int getsCost() {
		return sCost;
	}

	public void setsCost(int sCost) {
		this.sCost = sCost;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	@Override
	public String toString() {
		return "CampDaySales [sDay=" + sDay + ", sCampCode=" + sCampCode + ", sCampName=" + sCampName + ", sCost="
				+ sCost + ", sCount=" + sCount + "]";
	}

	
	
	
}

package sales.model.vo;

public class CampMonthSales implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7249921292920460824L;
	private String sMonth; // 매출월
	private int sCampCode; // 사업장 코드
	private String sCampName; // 사업장 이름 
	private int sCost; // 매출액
	private int sCount; // 매출건수 
	
	public CampMonthSales(String sMonth, int sCampCode, String sCampName, int sCost, int sCount) {
		this.sMonth = sMonth;
		this.sCampCode = sCampCode;
		this.sCampName = sCampName;
		this.sCost = sCost;
		this.sCount = sCount;
	}

	public String getsMonth() {
		return sMonth;
	}

	public void setsMonth(String sMonth) {
		this.sMonth = sMonth;
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
		return "CampMonthSales [sMonth=" + sMonth + ", sCampCode=" + sCampCode + ", sCampName=" + sCampName + ", sCost="
				+ sCost + ", sCount=" + sCount + "]";
	}
		
	
}

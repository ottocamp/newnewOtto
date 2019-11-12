package sales.model.vo;

public class CampYearSales implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1236970099482535382L;
	private String sYear; // 매출년
	private int sCampCode; // 사업장 코드
	private String sCampName; // 사업장 이름 
	private int sCost; // 매출액
	private int sCount; // 매출건수 
	
	public CampYearSales(String sYear, int sCampCode, String sCampName, int sCost, int sCount) {
		this.sYear = sYear;
		this.sCampCode = sCampCode;
		this.sCampName = sCampName;
		this.sCost = sCost;
		this.sCount = sCount;
	}

	public String getsYear() {
		return sYear;
	}

	public void setsYear(String sYear) {
		this.sYear = sYear;
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
		return "CampYearSales [sYear=" + sYear + ", sCampCode=" + sCampCode + ", sCampName=" + sCampName + ", sCost="
				+ sCost + ", sCount=" + sCount + "]";
	}
	
	
}

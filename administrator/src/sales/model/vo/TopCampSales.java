package sales.model.vo;

public class TopCampSales implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8565163592182899582L;
	private int sCampCode;
	private String sCampName;
	private String sYear;
	private int sCost;
	private int sCount;
	
	public TopCampSales(int sCampCode, String sCampName, String sYear, int sCost, int sCount) {
		super();
		this.sCampCode = sCampCode;
		this.sCampName = sCampName;
		this.sYear = sYear;
		this.sCost = sCost;
		this.sCount = sCount;
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

	public String getsYear() {
		return sYear;
	}

	public void setsYear(String sYear) {
		this.sYear = sYear;
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
		return "TopCampSales [sCampCode=" + sCampCode + ", sCampName=" + sCampName + ", sYear=" + sYear + ", sCost="
				+ sCost + ", sCount=" + sCount + "]";
	}
	
	
	
	
	
}

package sales.model.vo;

public class SiteYearSales implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3885494020256332729L;
	private String sYear;
	private int sCount;
	private int sCost;
	
	public SiteYearSales(String sYear, int sCount, int sCost) {
		super();
		this.sYear = sYear;
		this.sCount = sCount;
		this.sCost = sCost;
	}

	public String getsYear() {
		return sYear;
	}

	public void setsYear(String sYear) {
		this.sYear = sYear;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public int getsCost() {
		return sCost;
	}

	public void setsCost(int sCost) {
		this.sCost = sCost;
	}

	@Override
	public String toString() {
		return "SiteYearSales [sYear=" + sYear + ", sCount=" + sCount + ", sCost=" + sCost + "]";
	}
	
	
	
	
}

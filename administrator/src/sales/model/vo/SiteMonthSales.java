package sales.model.vo;

public class SiteMonthSales implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7807554760859336220L;
	private String sMonth;
	private int sCount;
	private int sCost;
	
	public SiteMonthSales(String sMonth, int sCount, int sCost) {
		super();
		this.sMonth = sMonth;
		this.sCount = sCount;
		this.sCost = sCost;
	}

	public String getsMonth() {
		return sMonth;
	}

	public void setsMonth(String sMonth) {
		this.sMonth = sMonth;
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
		return "SiteMonthSales [sMonth=" + sMonth + ", sCount=" + sCount + ", sCost=" + sCost + "]";
	}
	
	
	
}

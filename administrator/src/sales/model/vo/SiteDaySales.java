package sales.model.vo;

public class SiteDaySales implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7378150684456568709L;
	private String sDay;
	private int sCount;
	private int sCost;
	
	public SiteDaySales(String sDay, int sCount, int sCost) {
		super();
		this.sDay = sDay;
		this.sCount = sCount;
		this.sCost = sCost;
	}

	public String getsDay() {
		return sDay;
	}

	public void setsDay(String sDay) {
		this.sDay = sDay;
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
		return "SiteDaySales [sDay=" + sDay + ", sCount=" + sCount + ", sCost=" + sCost + "]";
	}
	
	
	
}

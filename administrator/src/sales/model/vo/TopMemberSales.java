package sales.model.vo;

public class TopMemberSales implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5749652912668095305L;
	private int sUserNo;
	private String sUserName;
	private String sYear;
	private int sCost;
	private int sCount;
	
	public TopMemberSales(int sUserNo, String sUserName, String sYear, int sCost, int sCount) {
		super();
		this.sUserNo = sUserNo;
		this.sUserName = sUserName;
		this.sYear = sYear;
		this.sCost = sCost;
		this.sCount = sCount;
	}

	public int getsUserNo() {
		return sUserNo;
	}

	public void setsUserNo(int sUserNo) {
		this.sUserNo = sUserNo;
	}

	public String getsUserName() {
		return sUserName;
	}

	public void setsUserName(String sUserName) {
		this.sUserName = sUserName;
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
		return "TopMemberSales [sUserNo=" + sUserNo + ", sUserName=" + sUserName + ", sYear=" + sYear + ", sCost="
				+ sCost + ", sCount=" + sCount + "]";
	}
	
	
	
	
	
}

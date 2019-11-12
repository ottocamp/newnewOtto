package amain.model.vo;

import java.io.Serializable;

public class MainIndexBar implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7762136436956452796L;
	private int mSales; // 한달간 매출액
	private int mPayCount; // 한달간 결제건수
	private int mJoinCount; // 한달간 회원가입수
	private int mApprovalCamp; // 사업승인 대기 건수
	
	public MainIndexBar(int mSales, int mPayCount, int mJoinCount, int mApprovalCamp) {
		super();
		this.mSales = mSales;
		this.mPayCount = mPayCount;
		this.mJoinCount = mJoinCount;
		this.mApprovalCamp = mApprovalCamp;
	}

	public int getmSales() {
		return mSales;
	}

	public void setmSales(int mSales) {
		this.mSales = mSales;
	}

	public int getmPayCount() {
		return mPayCount;
	}

	public void setmPayCount(int mPayCount) {
		this.mPayCount = mPayCount;
	}

	public int getmJoinCount() {
		return mJoinCount;
	}

	public void setmJoinCount(int mJoinCount) {
		this.mJoinCount = mJoinCount;
	}

	public int getmApprovalCamp() {
		return mApprovalCamp;
	}

	public void setmApprovalCamp(int mApprovalCamp) {
		this.mApprovalCamp = mApprovalCamp;
	}

	@Override
	public String toString() {
		return "MainIndexBar [mSales=" + mSales + ", mPayCount=" + mPayCount + ", mJoinCount=" + mJoinCount
				+ ", mApprovalCamp=" + mApprovalCamp + "]";
	}
	
	
	
}

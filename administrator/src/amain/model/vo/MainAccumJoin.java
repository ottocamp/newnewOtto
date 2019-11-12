package amain.model.vo;

import java.io.Serializable;

public class MainAccumJoin implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7580739561672481592L;
	private String mJoinYear; // 회원가입년
	private int mAccumCount; // 가입자수 
	
	public MainAccumJoin(String mJoinYear, int mAccumCount) {
		super();
		this.mJoinYear = mJoinYear;
		this.mAccumCount = mAccumCount;
	}

	public String getmJoinYear() {
		return mJoinYear;
	}

	public void setmJoinYear(String mJoinYear) {
		this.mJoinYear = mJoinYear;
	}

	public int getmAccumCount() {
		return mAccumCount;
	}

	public void setmAccumCount(int mAccumCount) {
		this.mAccumCount = mAccumCount;
	}

	@Override
	public String toString() {
		return "MainAccumJoin [mJoinYear=" + mJoinYear + ", mAccumCount=" + mAccumCount + "]";
	}
	
	
	
}

package amain.model.vo;

import java.io.Serializable;

public class MainJoinCount implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1210337055127808950L;
	private String mJoinDate; // 회원가입일자
	private int mCount; // 회원가입건수
	
	public MainJoinCount(String mJoinDate, int mCount) {
		super();
		this.mJoinDate = mJoinDate;
		this.mCount = mCount;
	}

	public String getmJoinDate() {
		return mJoinDate;
	}

	public void setmJoinDate(String mJoinDate) {
		this.mJoinDate = mJoinDate;
	}

	public int getmCount() {
		return mCount;
	}

	public void setmCount(int mCount) {
		this.mCount = mCount;
	}

	@Override
	public String toString() {
		return "MainJoinCount [mJoinDate=" + mJoinDate + ", mCount=" + mCount + "]";
	}
	
	
	
}

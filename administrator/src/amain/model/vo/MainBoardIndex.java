package amain.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MainBoardIndex implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8884448958443679104L;
	private int mBno; // 게시글 번호
	private String mBtitle; // 게시글 제목
	private String mBcontent; // 게시글 내용
	private Date mBdate; // 게시글 작성일
	private int mBtag; // 분류
	private int mBcount; // 조회수
	private int mBregion; // 지역
	private String mStatus; // 상태
	private String mDispoId; // 비회원 id
	private String mDispoPwd; // 비회원 비밀번호
	private int mBoardWriter; // 작성자
	private String mWriterName;
	
	public String getmWriterName() {
		return mWriterName;
	}

	public void setmWriterName(String mWriterName) {
		this.mWriterName = mWriterName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public MainBoardIndex(int mBno, String mBtitle, String mBcontent, Date mBdate, int mBtag, int mBcount, int mBregion,
			String mStatus, String mDispoId, String mDispoPwd, int mBoardWriter, String mWriterName) {
		super();
		this.mBno = mBno;
		this.mBtitle = mBtitle;
		this.mBcontent = mBcontent;
		this.mBdate = mBdate;
		this.mBtag = mBtag;
		this.mBcount = mBcount;
		this.mBregion = mBregion;
		this.mStatus = mStatus;
		this.mDispoId = mDispoId;
		this.mDispoPwd = mDispoPwd;
		this.mBoardWriter = mBoardWriter;
		this.mWriterName = mWriterName;
	}

	public MainBoardIndex(int mBno, String mBtitle, String mBcontent, Date mBdate, int mBtag, int mBcount, int mBregion,
			String mStatus, String mDispoId, String mDispoPwd, int mBoardWriter) {
		super();
		this.mBno = mBno;
		this.mBtitle = mBtitle;
		this.mBcontent = mBcontent;
		this.mBdate = mBdate;
		this.mBtag = mBtag;
		this.mBcount = mBcount;
		this.mBregion = mBregion;
		this.mStatus = mStatus;
		this.mDispoId = mDispoId;
		this.mDispoPwd = mDispoPwd;
		this.mBoardWriter = mBoardWriter;
	}

	public int getmBno() {
		return mBno;
	}

	public void setmBno(int mBno) {
		this.mBno = mBno;
	}

	public String getmBtitle() {
		return mBtitle;
	}

	public void setmBtitle(String mBtitle) {
		this.mBtitle = mBtitle;
	}

	public String getmBcontent() {
		return mBcontent;
	}

	public void setmBcontent(String mBcontent) {
		this.mBcontent = mBcontent;
	}

	public Date getmBdate() {
		return mBdate;
	}

	public void setmBdate(Date mBdate) {
		this.mBdate = mBdate;
	}

	public int getmBtag() {
		return mBtag;
	}

	public void setmBtag(int mBtag) {
		this.mBtag = mBtag;
	}

	public int getmBcount() {
		return mBcount;
	}

	public void setmBcount(int mBcount) {
		this.mBcount = mBcount;
	}

	public int getmBregion() {
		return mBregion;
	}

	public void setmBregion(int mBregion) {
		this.mBregion = mBregion;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getmDispoId() {
		return mDispoId;
	}

	public void setmDispoId(String mDispoId) {
		this.mDispoId = mDispoId;
	}

	public String getmDispoPwd() {
		return mDispoPwd;
	}

	public void setmDispoPwd(String mDispoPwd) {
		this.mDispoPwd = mDispoPwd;
	}

	public int getmBoardWriter() {
		return mBoardWriter;
	}

	public void setmBoardWriter(int mBoardWriter) {
		this.mBoardWriter = mBoardWriter;
	}

	@Override
	public String toString() {
		return "MainBoardIndex [mBno=" + mBno + ", mBtitle=" + mBtitle + ", mBcontent=" + mBcontent + ", mBdate="
				+ mBdate + ", mBtag=" + mBtag + ", mBcount=" + mBcount + ", mBregion=" + mBregion + ", mStatus="
				+ mStatus + ", mDispoId=" + mDispoId + ", mDispoPwd=" + mDispoPwd + ", mBoardWriter=" + mBoardWriter
				+ ", mWriterName=" + mWriterName + "]";
	}
	
	
	
	
	
}

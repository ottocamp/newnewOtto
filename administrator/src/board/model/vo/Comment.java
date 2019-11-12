package board.model.vo;

import java.sql.Date;

public class Comment {
	
	private int cNo;
	private String cContent;
	private Date updateDate;
	private int reviewScore;
	private String dispoId;
	private String dispoPwd;
	private int bNo;
	private String cWriter;
	private int campCode;
	private int userNo;
	
	public Comment() {
		
	}

	public Comment(int cNo, String cContent, Date updateDate, int reviewScore, String dispoId, String dispoPwd, int bNo,
			String cWriter, int campCode, int userNo) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.updateDate = updateDate;
		this.reviewScore = reviewScore;
		this.dispoId = dispoId;
		this.dispoPwd = dispoPwd;
		this.bNo = bNo;
		this.cWriter = cWriter;
		this.campCode = campCode;
		this.userNo = userNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getDispoId() {
		return dispoId;
	}

	public void setDispoId(String dispoId) {
		this.dispoId = dispoId;
	}

	public String getDispoPwd() {
		return dispoPwd;
	}

	public void setDispoPwd(String dispoPwd) {
		this.dispoPwd = dispoPwd;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public int getCampCode() {
		return campCode;
	}

	public void setCampCode(int campCode) {
		this.campCode = campCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Comment [cNo=" + cNo + ", cContent=" + cContent + ", updateDate=" + updateDate + ", reviewScore="
				+ reviewScore + ", dispoId=" + dispoId + ", dispoPwd=" + dispoPwd + ", bNo=" + bNo + ", cWriter="
				+ cWriter + ", campCode=" + campCode + ", userNo=" + userNo + "]";
	}


	
	
	
	
}
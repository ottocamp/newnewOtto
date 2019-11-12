package board.model.vo;

import java.sql.Date;

public class Board {
	
	private int bNo;
	private String bTitle;
	private String bContent;
	private Date updateDate;
	private int bTag;
	private int bCount;
	private int bRegion;
	private String status;
	private String bWriter;
	private String pwd;
	private int userNo;
	
	
	public Board() {
		
	}


	public Board(int bNo, String bTitle, String bContent, Date updateDate, int bTag, int bCount, int bRegion,
			String status, String bWriter, String pwd, int userNo) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.updateDate = updateDate;
		this.bTag = bTag;
		this.bCount = bCount;
		this.bRegion = bRegion;
		this.status = status;
		this.bWriter = bWriter;
		this.pwd = pwd;
		this.userNo = userNo;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public String getbTitle() {
		return bTitle;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public int getbTag() {
		return bTag;
	}


	public void setbTag(int bTag) {
		this.bTag = bTag;
	}


	public int getbCount() {
		return bCount;
	}


	public void setbCount(int bCount) {
		this.bCount = bCount;
	}


	public int getbRegion() {
		return bRegion;
	}


	public void setbRegion(int bRegion) {
		this.bRegion = bRegion;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getbWriter() {
		return bWriter;
	}


	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", updateDate=" + updateDate
				+ ", bTag=" + bTag + ", bCount=" + bCount + ", bRegion=" + bRegion + ", status=" + status + ", bWriter="
				+ bWriter + ", pwd=" + pwd + ", userNo=" + userNo + "]";
	}



}
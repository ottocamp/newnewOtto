package question.model.vo;

import java.sql.Date;

public class Question {
	private int qNo;
	private String qTitle;
	private String qContent;
	private Date updateDate;
	private int qTag;
	private String ansYN;
	private String ans;
	private String qWriter;
	private String pwd;
	private String aWriter;
	private String freq;
	private int userNo;
	
	public Question() {
		
	}

	public Question(int qNo, String qTitle, String qContent, Date updateDate, int qTag, String ansYN, String ans,
			String qWriter, String pwd, String aWriter, String freq, int userNo) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.updateDate = updateDate;
		this.qTag = qTag;
		this.ansYN = ansYN;
		this.ans = ans;
		this.qWriter = qWriter;
		this.pwd = pwd;
		this.aWriter = aWriter;
		this.freq = freq;
		this.userNo = userNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getqTag() {
		return qTag;
	}

	public void setqTag(int qTag) {
		this.qTag = qTag;
	}

	public String getAnsYN() {
		return ansYN;
	}

	public void setAnsYN(String ansYN) {
		this.ansYN = ansYN;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	public String getqWriter() {
		return qWriter;
	}

	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getaWriter() {
		return aWriter;
	}

	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}

	public String getFreq() {
		return freq;
	}

	public void setFreq(String freq) {
		this.freq = freq;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Question [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", updateDate=" + updateDate
				+ ", qTag=" + qTag + ", ansYN=" + ansYN + ", ans=" + ans + ", qWriter=" + qWriter + ", pwd=" + pwd
				+ ", aWriter=" + aWriter + ", freq=" + freq + ", userNo=" + userNo + "]";
	}
	
	
}

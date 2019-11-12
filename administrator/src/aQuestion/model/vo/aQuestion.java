package aQuestion.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class aQuestion implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8762411962953021417L;
	private int qCode; // 문의 번호 
	private String qTitle; // 문의 제목
	private String qContent; // 문의 내용
	private Date qDate; // 문의시간
	private String qTag; // 문의 카테고리(결제,예약, 설비, 기타)
	private String qYn; // 답변 여부
	private String qComment; // 답변 내용
	private int qWriter; // 문의자
	private int qAnswer; // 답변자 
	
	public aQuestion(int qCode, String qTitle, String qContent, Date qDate, String qTag, String qYn, String qComment,
			int qWriter, int qAnswer) {
		super();
		this.qCode = qCode;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qTag = qTag;
		this.qYn = qYn;
		this.qComment = qComment;
		this.qWriter = qWriter;
		this.qAnswer = qAnswer;
	}

	public int getqCode() {
		return qCode;
	}

	public void setqCode(int qCode) {
		this.qCode = qCode;
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

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getqTag() {
		return qTag;
	}

	public void setqTag(String qTag) {
		this.qTag = qTag;
	}

	public String getqYn() {
		return qYn;
	}

	public void setqYn(String qYn) {
		this.qYn = qYn;
	}

	public String getqComment() {
		return qComment;
	}

	public void setqComment(String qComment) {
		this.qComment = qComment;
	}

	public int getqWriter() {
		return qWriter;
	}

	public void setqWriter(int qWriter) {
		this.qWriter = qWriter;
	}

	public int getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(int qAnswer) {
		this.qAnswer = qAnswer;
	}

	@Override
	public String toString() {
		return "aQuestion [qCode=" + qCode + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate=" + qDate
				+ ", qTag=" + qTag + ", qYn=" + qYn + ", qComment=" + qComment + ", qWriter=" + qWriter + ", qAnswer="
				+ qAnswer + "]";
	}
	
	
	
	
	
}

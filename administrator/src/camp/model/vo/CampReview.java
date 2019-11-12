package camp.model.vo;

import java.io.Serializable;

public class CampReview implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 273919976400067776L;
	private int cReNo; // 예약번호
	private int cUserNo; // 회원번호
	private String cUserId; // 캠핑장코드
	private int cCampCode; // 캠핑장명
	private String cCampName; // 캠핑장명
	private String cReDate; // 예약일자
	private String cRTitle; // 리뷰제목
	private String cRContent; // 리뷰내용
	private int cRNum; // 점수 
	
	public CampReview(int cReNo, int cUserNo, String cUserId, int cCampCode, String cCampName, String cReDate,
			String cRTitle, String cRContent, int cRNum) {
		super();
		this.cReNo = cReNo;
		this.cUserNo = cUserNo;
		this.cUserId = cUserId;
		this.cCampCode = cCampCode;
		this.cCampName = cCampName;
		this.cReDate = cReDate;
		this.cRTitle = cRTitle;
		this.cRContent = cRContent;
		this.cRNum = cRNum;
	}

	public int getcReNo() {
		return cReNo;
	}

	public void setcReNo(int cReNo) {
		this.cReNo = cReNo;
	}

	public int getcUserNo() {
		return cUserNo;
	}

	public void setcUserNo(int cUserNo) {
		this.cUserNo = cUserNo;
	}

	public String getcUserId() {
		return cUserId;
	}

	public void setcUserId(String cUserId) {
		this.cUserId = cUserId;
	}

	public int getcCampCode() {
		return cCampCode;
	}

	public void setcCampCode(int cCampCode) {
		this.cCampCode = cCampCode;
	}

	public String getcCampName() {
		return cCampName;
	}

	public void setcCampName(String cCampName) {
		this.cCampName = cCampName;
	}

	public String getcReDate() {
		return cReDate;
	}

	public void setcReDate(String cReDate) {
		this.cReDate = cReDate;
	}

	public String getcRTitle() {
		return cRTitle;
	}

	public void setcRTitle(String cRTitle) {
		this.cRTitle = cRTitle;
	}

	public String getcRContent() {
		return cRContent;
	}

	public void setcRContent(String cRContent) {
		this.cRContent = cRContent;
	}

	public int getcRNum() {
		return cRNum;
	}

	public void setcRNum(int cRNum) {
		this.cRNum = cRNum;
	}

	@Override
	public String toString() {
		return "CampReview [cReNo=" + cReNo + ", cUserNo=" + cUserNo + ", cUserId=" + cUserId + ", cCampCode="
				+ cCampCode + ", cCampName=" + cCampName + ", cReDate=" + cReDate + ", cRTitle=" + cRTitle
				+ ", cRContent=" + cRContent + ", cRNum=" + cRNum + "]";
	}
	
	
	
	
	
}

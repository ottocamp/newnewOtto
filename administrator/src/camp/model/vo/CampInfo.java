package camp.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CampInfo implements Serializable{

	private static final long serialVersionUID = 8530584491485982766L;
	private int cCode; // 캠핑장 코드 
	private String cName; // 캠핑장명 
	private String cAddress; // 주소
	private String cPhone; // 전화번호
	private String cUrl; // 홈페이지주소
	private int cTheme; // 테마코드
	private String cAvailableDate; // 예약시작가능일자
	private String cPosting; // 포스팅제휴여부
	private String cRefundment; // 환불규정
	private String cEtc; // 기타
	private String cOperName; // 사업자명
	private String cOperNO; // 사업자번호
	private String cPermit; // 승인여부
	private String cOption; // 시설현황
	private int cUserNo; // 회원번호 
	
	public CampInfo() {}
	
	public CampInfo(int cCode, String cName, String cAddress, String cPhone, String cUrl, int cTheme,
			String cAvailableDate, String cPosting, String cRefundment, String cEtc, String cOperName, String cOperNO,
			String cPermit, String cOption, int cUserNo) {
		super();
		this.cCode = cCode;
		this.cName = cName;
		this.cAddress = cAddress;
		this.cPhone = cPhone;
		this.cUrl = cUrl;
		this.cTheme = cTheme;
		this.cAvailableDate = cAvailableDate;
		this.cPosting = cPosting;
		this.cRefundment = cRefundment;
		this.cEtc = cEtc;
		this.cOperName = cOperName;
		this.cOperNO = cOperNO;
		this.cPermit = cPermit;
		this.cOption = cOption;
		this.cUserNo = cUserNo;
	}
	

	public CampInfo(String cName, String cAddress, String cPhone, String cUrl, int cTheme, String cAvailableDate,
			String cPosting, String cRefundment, String cEtc, String cOperName, String cOperNO, String cOption,
			int cUserNo) {
		super();
		this.cName = cName;
		this.cAddress = cAddress;
		this.cPhone = cPhone;
		this.cUrl = cUrl;
		this.cTheme = cTheme;
		this.cAvailableDate = cAvailableDate;
		this.cPosting = cPosting;
		this.cRefundment = cRefundment;
		this.cEtc = cEtc;
		this.cOperName = cOperName;
		this.cOperNO = cOperNO;
		this.cOption = cOption;
		this.cUserNo = cUserNo;
	}






	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcUrl() {
		return cUrl;
	}

	public void setcUrl(String cUrl) {
		this.cUrl = cUrl;
	}

	public int getcTheme() {
		return cTheme;
	}

	public void setcTheme(int cTheme) {
		this.cTheme = cTheme;
	}

	public String getcAvailableDate() {
		return cAvailableDate;
	}

	public void setcAvailableDate(String cAvailableDate) {
		this.cAvailableDate = cAvailableDate;
	}

	public String getcPosting() {
		return cPosting;
	}

	public void setcPosting(String cPosting) {
		this.cPosting = cPosting;
	}

	public String getcRefundment() {
		return cRefundment;
	}

	public void setcRefundment(String cRefundment) {
		this.cRefundment = cRefundment;
	}

	public String getcEtc() {
		return cEtc;
	}

	public void setcEtc(String cEtc) {
		this.cEtc = cEtc;
	}

	public String getcOperName() {
		return cOperName;
	}

	public void setcOperName(String cOperName) {
		this.cOperName = cOperName;
	}

	public String getcOperNO() {
		return cOperNO;
	}

	public void setcOperNO(String cOperNO) {
		this.cOperNO = cOperNO;
	}

	public String getcPermit() {
		return cPermit;
	}

	public void setcPermit(String cPermit) {
		this.cPermit = cPermit;
	}

	public String getcOption() {
		return cOption;
	}

	public void setcOption(String cOption) {
		this.cOption = cOption;
	}

	public int getcUserNo() {
		return cUserNo;
	}

	public void setcUserNo(int cUserNo) {
		this.cUserNo = cUserNo;
	}

	@Override
	public String toString() {
		return "CampInfo [cCode=" + cCode + ", cName=" + cName + ", cAddress=" + cAddress + ", cPhone=" + cPhone
				+ ", cUrl=" + cUrl + ", cTheme=" + cTheme + ", cAvailableDate=" + cAvailableDate + ", cPosting="
				+ cPosting + ", cRefundment=" + cRefundment + ", cEtc=" + cEtc + ", cOperName=" + cOperName
				+ ", cOperNO=" + cOperNO + ", cPermit=" + cPermit + ", cOption=" + cOption + ", cUserNo=" + cUserNo
				+ "]";
	}
	
	
	
	
	
}

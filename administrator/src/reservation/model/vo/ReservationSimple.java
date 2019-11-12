package reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReservationSimple implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1221202707535530071L;
	private String reName; // 예약자 이름
	private String rePw; //예약 비밀번호
	private String rePhone; // 연락처
	private String reCar; // 차랑번호
	private String reMsg; // 메세지
	private String reCampName; // 캠핑장 명
	private String reSite; // 사업자명
	private Date reEntDate; // 입장일자
	
	
	public ReservationSimple() {}


	public ReservationSimple(String reName, String rePw, String rePhone, String reCar, String reMsg, String reCampName,
			String reSite, Date reEntDate) {
		super();
		this.reName = reName;
		this.rePw = rePw;
		this.rePhone = rePhone;
		this.reCar = reCar;
		this.reMsg = reMsg;
		this.reCampName = reCampName;
		this.reSite = reSite;
		this.reEntDate = reEntDate;
	}


	public String getReName() {
		return reName;
	}


	public void setReName(String reName) {
		this.reName = reName;
	}


	public String getRePw() {
		return rePw;
	}


	public void setRePw(String rePw) {
		this.rePw = rePw;
	}


	public String getRePhone() {
		return rePhone;
	}


	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
	}


	public String getReCar() {
		return reCar;
	}


	public void setReCar(String reCar) {
		this.reCar = reCar;
	}


	public String getReMsg() {
		return reMsg;
	}


	public void setReMsg(String reMsg) {
		this.reMsg = reMsg;
	}


	public String getReCampName() {
		return reCampName;
	}


	public void setReCampName(String reCampName) {
		this.reCampName = reCampName;
	}


	public String getReSite() {
		return reSite;
	}


	public void setReSite(String reSite) {
		this.reSite = reSite;
	}


	public Date getReEntDate() {
		return reEntDate;
	}


	public void setReEntDate(Date reEntDate) {
		this.reEntDate = reEntDate;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "ReservationSimple [reName=" + reName + ", rePw=" + rePw + ", rePhone=" + rePhone + ", reCar=" + reCar
				+ ", reMsg=" + reMsg + ", reCampName=" + reCampName + ", reSite=" + reSite + ", reEntDate=" + reEntDate
				+ "]";
	}
	
	

}

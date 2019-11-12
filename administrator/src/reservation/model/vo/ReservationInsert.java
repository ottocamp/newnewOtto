package reservation.model.vo;

import java.sql.Date;

public class ReservationInsert {
	
	private String cName; //캠핑장 이름
	private String rName;
	private String rPwd;
	private String rPhone;
	private String rCar;
	private String rMessage;
	

	public ReservationInsert() {}


	public ReservationInsert(String cName, String rName, String rPwd, String rPhone, String rCar, String rMessage) {
		super();
		this.cName = cName;
		this.rName = rName;
		this.rPwd = rPwd;
		this.rPhone = rPhone;
		this.rCar = rCar;
		this.rMessage = rMessage;
	}


	public String getcName() {
		return cName;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public String getrName() {
		return rName;
	}


	public void setrName(String rName) {
		this.rName = rName;
	}


	public String getrPwd() {
		return rPwd;
	}


	public void setrPwd(String rPwd) {
		this.rPwd = rPwd;
	}


	public String getrPhone() {
		return rPhone;
	}


	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}


	public String getrCar() {
		return rCar;
	}


	public void setrCar(String rCar) {
		this.rCar = rCar;
	}


	public String getrMessage() {
		return rMessage;
	}


	public void setrMessage(String rMessage) {
		this.rMessage = rMessage;
	}


	@Override
	public String toString() {
		return "ReservationInsert [cName=" + cName + ", rName=" + rName + ", rPwd=" + rPwd + ", rPhone=" + rPhone
				+ ", rCar=" + rCar + ", rMessage=" + rMessage + "]";
	}

	
	
	
	
	
}

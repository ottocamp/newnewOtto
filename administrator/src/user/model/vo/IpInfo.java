package user.model.vo;

import java.io.Serializable;

public class IpInfo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2231730508953351018L;
	private String date;
	private String ip;
	private String country;
	private String sof;
	
	public IpInfo() {}

	public IpInfo(String date, String ip, String country, String sof) {
		super();
		this.date = date;
		this.ip = ip;
		this.country = country;
		this.sof = sof;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getSof() {
		return sof;
	}

	public void setSof(String sof) {
		this.sof = sof;
	}

	@Override
	public String toString() {
		return "IpInfo [date=" + date + ", ip=" + ip + ", country=" + country + ", sof=" + sof + "]";
	}
	
	

}

package user.model.vo;

import java.io.Serializable;

public class UserPropic implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7382080081421122570L;
	private int userNo;
	private String originName;
	private String changeName;
	
	public UserPropic() {}

	public UserPropic(int userNo, String originName, String changeName) {
		super();
		this.userNo = userNo;
		this.originName = originName;
		this.changeName = changeName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "UserPropic [userNo=" + userNo + ", originName=" + originName + ", changeName=" + changeName + "]";
	}
	
	
	

}

package camp.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1823628387215763844L;
	private int fId; // 사진 일련번호
	private String originName; // 원래이름
	private String changeName; // 바꾼이름
	private String filePath; // 경로
	private Date uploadDate; // 변경 날짜
	private int cCode; // 캠핑장 코드
	private int cType; // 사진 타입
	
	public Attachment() {}
	
	public Attachment(int fId, String originName, String changeName, String filePath, Date uploadDate, int cCode,
			int cType) {
		super();
		this.fId = fId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.cCode = cCode;
		this.cType = cType;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public int getcType() {
		return cType;
	}

	public void setcType(int cType) {
		this.cType = cType;
	}

	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", cCode=" + cCode + ", cType=" + cType + "]";
	}
			
	
}

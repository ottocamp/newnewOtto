package common;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class PropicRenamePolicy implements FileRenamePolicy{
	private String uid;
	public PropicRenamePolicy() {}
	
	public PropicRenamePolicy(String uid) {
		this.uid = uid;
	}

	@Override
	public File rename(File originFile) {

				

				String name = originFile.getName(); 
				
				String ext = "";
				
				int dot = name.lastIndexOf("."); 
				
				if(dot != -1) { // 존재할 경우

					ext = name.substring(dot); 
				}
				
				// 최종적으로 수정할 파일명
				String fileName = uid.toLowerCase() + ext.toLowerCase();
				
				// 파일을 변경된 파일명으로 생성
				File newFile = new File(originFile.getParent(), fileName);
				
				return newFile;
			}

}

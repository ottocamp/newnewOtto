package user.model.vo;

public class RandomCode {
	
	
	
	public String RandomCode(int num) {
		
		String code ="";
				
		for(int i=0;i<num;i++) {
			code+=(char)((Math.random()*26)+65); 
		}
	
		return code;
	}
	
	
	

}

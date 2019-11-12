<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.controller.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("utf-8");

 	String uid = (String)request.getAttribute("uid");
	String uemail = (String)request.getAttribute("uemail");
	String rcode = (String)request.getAttribute("rcode");
  

Properties p = new Properties(); // 정보를 담을 객체

  

p.put("mail.smtp.host","smtp.naver.com");
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");

 

  

try{

    Authenticator auth = new SMTPAuthenticatior();

    Session ses = Session.getInstance(p, auth);

      

    ses.setDebug(true);

    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체  

 

    msg.setSubject("오또캠프 비밀번호 재설정 이메일 입니다"); //  제목 

 
    
    StringBuffer buffer = new StringBuffer();
    
    String ip = InetAddress.getLocalHost().getHostAddress();
    int port = request.getLocalPort();
   
    String address ="http://"+ip+":"+port+"/administrator/PWDREA?uid="+uid+"&rcode="+rcode;
    buffer.append("오또 캠프 가입완료를 하시려면 밑에 '비밀번호 재설정' 링크를 클릭 해주세요<br><br><br>");
    buffer.append("<a href='"+address+"'>비밀번호 재설정</a> ");
    

    Address fromAddr = new InternetAddress("whqotjd@naver.com");     //보내는 사람 이메일을 쓴다

    msg.setFrom(fromAddr);                                             //보내는 사람 이메일이 열로 와짐
	
 

    Address toAddr = new InternetAddress(uemail);      //받는 사람 이메일을 여기 쓰면 밑으로 감

    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람 

     

    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용

    Transport.send(msg); // 전송   
    
    request.setAttribute("msg", "비밀번호 재 전송용 이메일을 발송 하였습니다");
    request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);

 

} catch(Exception e){
	
    request.setAttribute("msg", "가입 이메일 발송 실패");
 	request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);

    e.printStackTrace();

    return;

}

%>


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
  

String from = "whqotjd@naver.com";
String mTitle = request.getParameter("mTitle");
String sumtext = request.getParameter("sumtext");
String code = request.getParameter("mcCode");
int port = request.getLocalPort();
String ip = InetAddress.getLocalHost().getHostAddress();
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
 
    msg.setSubject(mTitle); //  제목
 
    StringBuffer buffer = new StringBuffer();
    buffer.append(sumtext +"<br>");
    if(code != null){
    buffer.append("<a href='http://"+ ip +":"+port +"/administrator/'><img src='https://i.imgur.com/ORIswqX.png'><a>");
    buffer.append("<br><img src='http://" + ip +":"+port +"/administrator/resources/mail/"+ code +".png'>");
    }
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); 
 
    String[] mailList = (String[])session.getAttribute("mailList");
    InternetAddress[] toAddr = new InternetAddress[mailList.length];
    for(int i = 0; i < mailList.length; i++){
    	toAddr[i] = new InternetAddress (mailList[i]);   	
    }
  
    msg.setRecipients(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
    Transport.send(msg); // 전송  
    
    request.getSession().setAttribute("msg", "메일보내기에 성공하였습니다.");
 	request.getRequestDispatcher("MailSendView.jsp").forward(request, response);
 	
} catch(Exception e){
	request.setAttribute("msg", "메일보내기에 실패하였습니다.");
	request.getRequestDispatcher("../common/errorPage.jsp");
	
    e.printStackTrace();
    return;
}
%>


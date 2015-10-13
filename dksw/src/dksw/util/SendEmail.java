package dksw.util;

import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmail {

	public static boolean SendEmail(String receiver, String subject, String contents) {
   
		try {
	        Properties props = new Properties(); 
	        props.setProperty("mail.transport.protocol", "smtp"); 
	        props.setProperty("mail.host", "smtp.gmail.com"); 
	        props.put("mail.smtp.auth", "true"); 
	        props.put("mail.smtp.port", "465"); 
	        props.put("mail.smtp.socketFactory.port", "465"); 
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	        props.put("mail.smtp.socketFactory.fallback", "false"); 
	        props.setProperty("mail.smtp.quitwait", "false"); 
	        
	        Authenticator auth = new Authenticator(){
	        	protected PasswordAuthentication getPasswordAuthentication() { 
	                return new PasswordAuthentication("dankook.sw@gmail.com", "whdgkqtjfrP1"); 
	            }
	        };
	   
	        Session session = Session.getDefaultInstance(props,auth);
	        
	        MimeMessage message = new MimeMessage(session); 
	        message.setSender(new InternetAddress("dankook.sw@gmail.com")); 
	        message.setSubject(subject);
	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 
	        
	        Multipart mp = new MimeMultipart();
	        MimeBodyPart mbp1 = new MimeBodyPart();
	        mbp1.setContent(contents, "text/html; charset=utf-8");
	        
	        mp.addBodyPart(mbp1);

	        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	        CommandMap.setDefaultCommandMap(mc);
	        
	        message.setContent(mp);

	        Transport.send(message);
	        
	        return true;
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
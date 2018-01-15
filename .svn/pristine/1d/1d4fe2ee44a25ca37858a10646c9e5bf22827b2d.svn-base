package rwb.java.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import rwb.java.divers.Log;


public class GoogleMail {
	
	/**
	 * Class constructor
	 */
	public GoogleMail(){
		//nothing to do 
	}

	/**
	 * 
	 * @param mailFrom
	 * @param mdp
	 * @param mailTo
	 * @param textMessage
	 * @return
	 */
    public boolean sendMail(String mailFrom, String mdp, String mailTo, String textMessage) {

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, 
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, mdp);
            }
          });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mailFrom));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(mailTo));
            message.setSubject("Remote Web Box");
            message.setText(textMessage);
            Transport.send(message);
            return true;
        } catch (Exception e) {
        	Log.warning(e.toString());
        	return false;
        }
    }
}
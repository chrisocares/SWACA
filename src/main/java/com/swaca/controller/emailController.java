package com.swaca.controller;

import javax.servlet.http.HttpServletRequest;

import org.jfree.util.Log;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

@Controller
public class emailController {

    @RequestMapping(value="sendEmail-{Receptor}" ,  method = RequestMethod.POST)
    public void doSendEmail(HttpServletRequest request , @PathVariable("Receptor")String receptor) throws AddressException, MessagingException {

    	 Properties props = new Properties();
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.smtp.host", "smtp.gmail.com");
         props.put("mail.smtp.port", "587");
         props.put("mail.smtp.user", "chrisocares@gmail.com");
         Session session = Session.getDefaultInstance(props);
    	 Message message = new MimeMessage(session);
    	 message.setFrom(new InternetAddress("chrisocares@gmail.com"));
    	 System.out.println("TO : "+receptor);
    	 InternetAddress[] toAddresses = { new InternetAddress(receptor+".com") };
    	 message.setRecipients(Message.RecipientType.TO, toAddresses);
    	 message.setSubject("ANDROID & SMART - Emision de Orden de Compra");
    	 message.setSentDate(new Date());
    	 BodyPart messageBodyPart = new MimeBodyPart();
    	 messageBodyPart.setText("Se remite la Orden de Compra , espero su confirmación.");
    	 Multipart multipart = new MimeMultipart();
    	 multipart.addBodyPart(messageBodyPart);
    	 messageBodyPart = new MimeBodyPart();
    	 String filename = "/g/ordenCompra.pdf";
    	 DataSource source = new FileDataSource(filename);
    	 messageBodyPart.setDataHandler(new DataHandler(source));
    	 messageBodyPart.setFileName("Orden de Compra.pdf");
    	 multipart.addBodyPart(messageBodyPart);
    	 message.setContent(multipart);
    	 Transport t = session.getTransport("smtp");
         t.connect("swaca001@gmail.com", "swaca01urp");
         t.sendMessage(message, message.getAllRecipients());
         t.close();
    	 System.out.println("Orden de Compra enviada exitosamente....");
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.helper;

import com.farmer.open.discussion.entities.MailEntity;
import com.farmer.open.discussion.servlets.MyAuth;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author PANDIT
 */
public class Mail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean SendMail(MailEntity me) {
        String from = "rajkumarpandit436@gmail.com";
        String pass = "dxtvvzfpvcjnykrd";
        boolean mail_status = false;
        try {

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.mail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            MyAuth auth = new MyAuth(from, pass);
            auth.getPasswordAuthentication();
            props.put("mail.debug", "true");
            Session session = Session.getInstance(props, auth);
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(me.getTo()));
            msg.setSubject(me.getSub());
            msg.setSentDate(new Date());
            msg.setText(me.getMsg_body());
            Transport.send(msg);
            mail_status = true;
        } catch (MessagingException e) {
        }
        return mail_status;

    }

}

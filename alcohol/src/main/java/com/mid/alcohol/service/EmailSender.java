package com.mid.alcohol.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;

public class EmailSender {
    public static void sendEmail(String recipientEmail, String subject, String content) throws MessagingException {
        // SMTP 서버 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // 이메일 계정 정보
        String senderEmail = "brandena@naver.com";
        String senderPassword = "ehgus7575!";

        // 세션 생성
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        // 이메일 메시지 생성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject(subject);
        message.setText(content);

        // 이메일 전송
        Transport.send(message);
    }
}

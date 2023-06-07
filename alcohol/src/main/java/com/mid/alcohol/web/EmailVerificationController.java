package com.mid.alcohol.web;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.service.EmailSender;

import javax.mail.MessagingException;

@RestController
public class EmailVerificationController {
    @PostMapping("/api/email-verification")
    public String sendEmailVerification(@RequestBody EmailVerificationRequest request) {
        String recipientEmail = request.getEmail();
        String subject = "이메일 인증";
        String content = "인증 링크를 클릭하여 이메일 인증을 완료하세요.";

        try {
            EmailSender.sendEmail(recipientEmail, subject, content);
            return "이메일 전송 완료";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "이메일 전송 실패";
        }
    }
}


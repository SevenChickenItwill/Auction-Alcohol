package com.mid.alcohol.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.User;
import com.mid.alcohol.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController // jsp를 사용하지않고 js와 소통한다.
@RequestMapping("/api/signup")
@Slf4j
@RequiredArgsConstructor
public class UserListController {

    private final UserService userService;

    // 중복된 별명이 있는지 확인함
    @GetMapping("/signup/{userNickname}")
    public ResponseEntity<String> signupCheck(@PathVariable String userNickname) {
        log.info("singup(userNickname={})", userNickname);

        User user = userService.signupCheck(userNickname);

        log.info("userNickname={}", user);

        if (user != null) {
            return ResponseEntity.ok(user.getUserName());
        } else {
            return ResponseEntity.ok(null);
        }
    }
    
    // 중복된 이메일이 있는지 확인함
    @GetMapping("/signupEmail/{userEmail}")
    public ResponseEntity<String> signupEmailCheck(@PathVariable String userEmail) {
        log.info("signupEmail(userEmail={})", userEmail);
        
        User user = userService.signupEmailCheck(userEmail);
        
        log.info("userEmail={}", user);
        
        if (user != null) {
            return ResponseEntity.ok(user.getUserName());
        } else {
            return ResponseEntity.ok(null);
        }
    }
    
}

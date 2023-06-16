package com.mid.alcohol.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.user.UserPasswordUpdateDto;
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
    
    // 해당 이메일의 비밀번호가 맞는지 확인
    @GetMapping("/passwordModify/{userEmail}/{userPassword}/{newPassword}")
    public ResponseEntity<String> userPasswordCheck(
            @PathVariable String userEmail,
            @PathVariable String userPassword,
            @PathVariable String newPassword) {

        User user = userService.signupEmailCheck(userEmail);
        log.info("user={}",user);
        
        if (user != null && user.getUserPassword().equals(userPassword)) {
            // 비밀번호가 일치하는 경우
        	UserPasswordUpdateDto dto = UserPasswordUpdateDto.builder().userEmail(userEmail).userPassword(newPassword).build();
        	userService.PasswordUpdate(dto);
            return ResponseEntity.ok("valid"); // 비밀번호가 일치함을 알리는 응답 반환
        } else {
            // 비밀번호가 일치하지 않는 경우
            return ResponseEntity.ok("invalid"); // 비밀번호가 일치하지 않음을 알리는 응답 반환
        }
    }



    
}

package com.mid.alcohol.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.dto.UserSignupDto;
import com.mid.alcohol.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/signup")
@Controller
public class UserController {

    private final UserService userService;
    
    @GetMapping("/signupEmail")
    public void signupEmail() {
        log.info("signupEmail()");
    }
    
    @PostMapping("/signupEmail")
    public String signupEmail(UserSignupDto dto,
            @RequestParam("userEmail") String userEmail, Model model) {
        log.info("signupEmail()", dto);
        log.info("email={}",userEmail);
        
        model.addAttribute("userEmail",userEmail);
        
        return "/signup/signup";
    }
    
    // 회원가입 페이지로 이동
    @GetMapping("/signup")
    public void signup() {
        log.info("signup()");
    }

    // 회원가입 처리
    @PostMapping("/signup")
    public String signup(UserSignupDto dto,
            @RequestParam("userEmail") String userEmail) {
        log.info("signup({})", dto);
        
        dto.setUserEmail(userEmail);

        int result = userService.signup(dto);
        log.info("회원가입 결과 = {}", result);

        // 회원가입 완료 페이지로 넘겨줌
        return "/signup/signupCompletion";
    }


    @GetMapping("/signupCompletion")
    public void signupCompletion() {
        log.info("signupCompletion()");
    }
        
 
    // 메인 페이지 이동
     @GetMapping("/main")
     public void main() {
         log.info("main()");
     }
    
    
    // 계정 목록으로 페이지 이동 
     @GetMapping("/userModify")
     public void userModify() {
      // 사용자 수정 페이지로 이동하는 로직 구현
      
     }
    @PostMapping("/userModify")
    public String userModify(UserSignupDto dto) {
    	
    	return"/signup/userPasswordModify";
    }
    
    @GetMapping("/userPasswordModify")
    public void userPasswordModify() {
    	
    }
    
    @PostMapping("/userPasswordModify")
    public String userPasswordModify(UserSignupDto dto) {
      // 비밀번호 수정 로직 구현
      return "/signup/userModify"; // 수정 후 사용자 수정 페이지로 이동
    }
    
    
    
    
    @PostMapping("/userPhoneModify")
    public String userPhoneModify() {
      // 전화번호 수정 로직 구현
      return "/signup/userModify"; // 수정 후 사용자 수정 페이지로 이동
    }
    

}

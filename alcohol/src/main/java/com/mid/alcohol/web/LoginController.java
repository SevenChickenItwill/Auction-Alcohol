package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

 
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그
@RequiredArgsConstructor // 생성자에 의한 의존성 주입
@RequestMapping("/account") // PostController 클래스의 메서드들은 요청주소가 "/account"로 시작
@Controller // DispatcherServlet에게 컨트롤러 컴포넌트로 등록
public class LoginController {
    
    // 컨테스트 루트는 프로젝트 이름까지.
    
    // 컨트롤러에서 요청주소들을 처리한다
    // 디스패처 서블릿에서 요청주소 분석해서 처리하는 해당 컨트롤러를 호출한다
 
    @GetMapping("/login")
    public void login() {
        log.info("login()");    
     }
    
    
    
    // 가입 완료한 회원정보를 DB에 삽입하기 위해서 설정한 경로
    @PostMapping("/path")
    public String path() {
        log.info("path()");
        
        return "redirect:/account/login";
    }
    
     
    
    
    @GetMapping("/enroll")
    public void enroll() {
        log.info("enroll()");  
    }
  

}

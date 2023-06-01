package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그
@RequiredArgsConstructor // 생성자에 의한 의존성 주입
@Controller // DispatcherServlet에게 컨트롤러 컴포넌트로 등록
public class homeController {

    
    @GetMapping("/") // 컨테스트 루트를 views 까지로 설정해놓은 상태
    public String home() {
        log.info("home()");
        
        return "index";
    }
}

package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.domain.Login;
import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.LoginCheckDto;
import com.mid.alcohol.dto.UserSignupDto;
import com.mid.alcohol.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j // 로그
@RequiredArgsConstructor // 생성자에 의한 의존성 주입
@RequestMapping("/account") // PostController 클래스의 메서드들은 요청주소가 "/account"로 시작
@Controller // DispatcherServlet에게 컨트롤러 컴포넌트로 등록
public class LoginController {
    
    private final UserService userService;
    // 컨테스트 루트는 프로젝트 이름까지.
    
    // 컨트롤러에서 요청주소들을 처리한다
    // 디스패처 서블릿에서 요청주소 분석해서 처리하는 해당 컨트롤러를 호출한다
 
    
    
     
    
    
    
    
    @PostMapping("/login")
    public String login(LoginCheckDto dto, HttpSession session) {
        
        User user = userService.login(dto);
        
        session.setAttribute("userEmail", user.getUserEmail());
        session.setAttribute("userPassword", user.getUserPassword());
        session.setAttribute("userNickname", user.getUserNickname());
        
        return "redirect:/auction/auctionlist";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("userEmail");
    	session.removeAttribute("userPassword");
    	session.removeAttribute("userNickname");
    	return "redirect:/signup/signupEmail";
    }
    
    @GetMapping("/loginNew")
    public void loginNew() {
        
        
    }
    
    @PostMapping("/loginNew")
    public void loginPassword(UserSignupDto dto, Model model) {
        log.info("loginPassword", dto);
        
        model.addAttribute("userEmail", dto.getUserEmail());
    }
        
        
    
    
  

}
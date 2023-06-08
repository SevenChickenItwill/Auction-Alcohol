package com.mid.alcohol.service;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.Login;
import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.LoginCheckDto;
import com.mid.alcohol.dto.UserSignupDto;
import com.mid.alcohol.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class UserService {

    private final UserRepository userRepository;
    
    
    public int signup(UserSignupDto dto) {
        log.info("signup({})", dto);
        
          
        
        // 회원가입 처리
        return userRepository.userMainSignup(dto.toEntity());

    }
    
    public Login login(LoginCheckDto login) {
    	
    	log.info("login()");
    	
    	return userRepository.signInMain(login.toEntity());
    	
    }
    
}

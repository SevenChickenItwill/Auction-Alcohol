package com.mid.alcohol.service;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.UserModifyDto;
import com.mid.alcohol.dto.UserSignupDto;
import com.mid.alcohol.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class UserService {
	
	// 회원가입을 하기위해
    private final UserRepository userRepository;

    public int signup(UserSignupDto dto) {
        log.info("signup({})", dto);
       
        
        return userRepository.userMainSignup(dto.toEntity());
    }
    
    // 계정 정보를 수정하기 위해
    public UserModifyDto read(String userEmail) {
        log.info("read(userEmail={})", userEmail);

        User entity = userRepository.findByUserEmail(userEmail);

        UserModifyDto dto = UserModifyDto.fromEntity(entity);

        return dto; 
    }
    
    // 중복된 별명이 있는지 
    public UserSignupDto findByNickname(String userNickname) {
		log.info("findByNickname()");

		return userRepository.findByUserNickname(userNickname);

	}
    
}

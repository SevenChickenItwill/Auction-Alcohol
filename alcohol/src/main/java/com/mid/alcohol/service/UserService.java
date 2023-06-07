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

    private final UserRepository userRepository;

    public int signup(UserSignupDto dto) {
        log.info("signup({})", dto);
        

        // 중복이 없는 경우 회원가입 처리
        return userRepository.userMainSignup(dto.toEntity());
    }

    public UserModifyDto read(String userEmail) {
        log.info("read(userEmail={})", userEmail);

        User entity = userRepository.findByUserEmail(userEmail);

        UserModifyDto dto = UserModifyDto.fromEntity(entity);

        return dto; 
    }
}

package com.mid.alcohol.repository;

import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.user.FindByUserPasswordDto;
import com.mid.alcohol.dto.user.UserPasswordUpdateDto;

public interface UserRepository {
    
	// 이메일을 DB에 넣기위해
    int userEmailSignup(User user);
    
    // 회원정보를 DB에 넣기위해
    int userMainSignup(User user);
    
    // 중복된 별명이 있는지
    User findByUserNickname(String userNickname);
    
    // 중복된 이메일이 있는지, 계정 페이지에서 상세보기
    User findByUserEmail(String userEmail);
    
    // 로그인 하기 위해
    User signInMain(User login);
    
    // 비밀번호 수정
    int PasswordUpdate(UserPasswordUpdateDto user);
    
    // 해당 이메일의 비밀번호인지 확인
    User findUserByEmailAndPassword (String userEmail, String userPassword);
    
    // 전화번호 수정
    int PhoneUpdate(User user);
    
    // 주소 수정
    int AddressUpdate(User user);
    
    // 계정 비활성화
    int DeactivationAccount(String userEmail);
    
    // 계정 활성화
    int ActivationAccount(String userEmail);
    
    // 유저 비밀번호 찾기
    User findByUserPassword(FindByUserPasswordDto dto);
    
    
}

package com.mid.alcohol.repository;

import com.mid.alcohol.domain.User;

import com.mid.alcohol.domain.Login;
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
    User signInMain(Login login);
    
    // 수정 페이지에 정보전달
    User selectByEmail (String userEmail);

    
}

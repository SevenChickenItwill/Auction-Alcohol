package com.mid.alcohol.service;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.Login;
import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.LoginCheckDto;
import com.mid.alcohol.dto.user.UserDetaillDto;
import com.mid.alcohol.dto.user.UserSignupDto;
import com.mid.alcohol.dto.user.UserPasswordUpdateDto;
import com.mid.alcohol.dto.user.UserPhoneUpdateDto;
import com.mid.alcohol.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Repository
public class UserService {

	private final UserRepository userRepository;

	// 회원가입을 하기위해
	public int signup(UserSignupDto dto) {
		log.info("signup({})", dto);

		return userRepository.userMainSignup(dto.toEntity());
	}

	// 중복된 별명이 있는지
	public User signupCheck(String userNickname) {
		log.info("signupCheck()");

		return userRepository.findByUserNickname(userNickname);
	}

	// 중복된 이메일이 있는지
	public User signupEmailCheck(String userEmail) {
		log.info("signupEmailCheck()");

		return userRepository.findByUserEmail(userEmail);
	}

	// 로그인
	public User login(LoginCheckDto login) {

		log.info("login()");

		return userRepository.signInMain(login.toEntity());
	}

	// 계정 정보를 보여주기위해
	public UserDetaillDto read(String userEmail) {
		log.info("read(userEmail={})", userEmail);

		User entity = userRepository.findByUserEmail(userEmail);

		UserDetaillDto dto = UserDetaillDto.fromEntity(entity);

		return dto;
	}
	
	// 비밀번호 수정
	public int PasswordUpdate(UserPasswordUpdateDto user) {
		log.info("update({})", user);
		
		return userRepository.PasswordUpdate(user);
	}
	
	// 해당 이메일의 비밀번호인지 확인
	public User UserPasswordCheck(String userEmail, String userPassword) {
		log.info("UserPasswordCheck()");

		return userRepository.findUserByEmailAndPassword(userEmail, userPassword);
	}
	
	// 전화번호 수정
	public int PhoneUpdate(UserPhoneUpdateDto user) {
		log.info("update({})", user);	
		
		return userRepository.PhoneUpdate(user);

	}


}

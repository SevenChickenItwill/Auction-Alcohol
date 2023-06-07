package com.mid.alcohol.web;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.dto.UserSignupDto;
import com.mid.alcohol.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/signup")
@Slf4j
@RequiredArgsConstructor
public class UserListController {

    private final UserService userService;
	
  // 중복된 별명이 있는지 확인하기위해
  @GetMapping("/signup/{userNickname}")
  public void signup(@RequestParam String userNickname, Model model) {
  	log.info("singup(userNickname={})", userNickname);
  	
  	UserSignupDto dto = userService.findByNickname(userNickname);
  	log.info("dto={}", dto);
  	model.addAttribute("signup", dto);
  }
}

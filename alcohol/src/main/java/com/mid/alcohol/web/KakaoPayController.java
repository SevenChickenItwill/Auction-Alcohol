package com.mid.alcohol.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.KakaoPayResponse;
import com.mid.alcohol.dto.KakaoPayDto;
import com.mid.alcohol.service.KakaoPayService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class KakaoPayController {
	 @Setter(onMethod_ = {@Autowired})
	 private KakaoPayService kakaoService;
	 
	 @GetMapping("/kakaoPay")
	 public void kakaoPayGet() {
		 
	 }
	 
	 @PostMapping("/kakaoPay")
	 public String kakaoPay() {
		 log.info("kakaoPay post");
		 
		 return "redirect:"; // TODO:
	 }
	 
	 @GetMapping("kakaoPaySuccess")
	 public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		 log.info("kakaoPaySuccess get");
		 log.info("kakaoPaySuccess pg_token" + pg_token);
	 }

}

package com.mid.alcohol.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.Login;
import com.mid.alcohol.dto.LoginCheckDto;
import com.mid.alcohol.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController("/api/login")
@Slf4j
public class LoginRestController {

	@Autowired
	private UserService service;
	
	@PostMapping("/check")
	public ResponseEntity<Integer> check(@RequestBody LoginCheckDto dto){
		
		Login login = service.login(dto);
		int result = 1;
		if(login==null) {
			result = 0;
		}
		
		return ResponseEntity.ok(result);
		
	}
	
}
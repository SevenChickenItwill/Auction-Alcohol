package com.mid.alcohol.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.Login;
import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.LoginCheckDto;
import com.mid.alcohol.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/api/login")
public class LoginRestController {

	@Autowired
	private UserService service;
	
	@PostMapping("/check")
	public ResponseEntity<Integer> check(@RequestBody LoginCheckDto dto){
		log.info("check({})",dto);
		User login = service.login(dto);
		int result = 1;
		if(login==null) {
			result = 0;
		}
		
		return ResponseEntity.ok(result);
		
	}
	
}
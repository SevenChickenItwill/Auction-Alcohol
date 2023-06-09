package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Login;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class LoginCheckDto {

	private String userEmail;
	private String userPassword;
	
	public Login toEntity() {
		
	 return	Login.builder().userEmail(userEmail).userPassword(userPassword).build();
		
	}
	
}

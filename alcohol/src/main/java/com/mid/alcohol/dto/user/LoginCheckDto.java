package com.mid.alcohol.dto.user;


import com.mid.alcohol.domain.user.User;

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
	
	public User toEntity() {
		
	 return	User.builder().userEmail(userEmail).userPassword(userPassword).build();
		
	}
	
}

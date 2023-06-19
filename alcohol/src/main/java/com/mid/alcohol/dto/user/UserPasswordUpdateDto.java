package com.mid.alcohol.dto.user;

import com.mid.alcohol.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class UserPasswordUpdateDto {
	private String userEmail;
	private String userPassword;
	
	public User toEntity() {
		
		return User.builder()
				.userEmail(userEmail)
				.userPassword(userPassword)			
				.build();
	}
	
}

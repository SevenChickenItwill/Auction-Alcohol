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
public class FindByUserPasswordDto {
	private String userName;
	private String userEmail;
	private String userPhone;
	
	public User toEntity() {
		
		return User.builder()
				.userName(userName)
				.userEmail(userEmail)
				.userPhone(userPhone)
				.build();
	}
}

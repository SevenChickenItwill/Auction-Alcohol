package com.mid.alcohol.dto;

import com.mid.alcohol.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserPhoneUpdateDto {
	private String userPhone;
	
	public User toEntity() {
		
		return User.builder()
				.userPhone(userPhone)
				.build();
	}
}

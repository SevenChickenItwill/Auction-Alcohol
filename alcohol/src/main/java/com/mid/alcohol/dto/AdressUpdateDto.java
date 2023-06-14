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
public class AdressUpdateDto {
	private String userNickname;
	private String userAddress;
	private String userPhone;
	private String userEmail;
	
	public User toEntity() {
		return User.builder()
				.userNickname(userNickname)
				.userAddress(userAddress)
				.userPhone(userPhone)
				.userEmail(userEmail)
				.build();
	}
}

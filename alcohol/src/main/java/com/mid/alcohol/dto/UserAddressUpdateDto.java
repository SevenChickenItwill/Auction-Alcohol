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
public class UserAddressUpdateDto {
	private String userAddress;
	
	public User toEntity() {
		
		return User.builder()
				.userAddress(userAddress)
				.build();
	}
}

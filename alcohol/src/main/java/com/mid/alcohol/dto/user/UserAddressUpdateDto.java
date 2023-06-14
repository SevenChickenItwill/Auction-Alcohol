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
public class UserAddressUpdateDto {
	private String userAddress;
	
	public User toEntity() {
		
		return User.builder()
				.userAddress(userAddress)
				.build();
	}
}

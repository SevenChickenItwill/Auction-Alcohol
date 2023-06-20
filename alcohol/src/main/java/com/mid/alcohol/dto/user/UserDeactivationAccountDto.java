package com.mid.alcohol.dto.user;

import com.mid.alcohol.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UserDeactivationAccountDto {
	private String userEmail;
	private int deactivationAccount;
	
	public User toEntity() {
		return User.builder()
				.userEmail(userEmail)
				.deactivationAccount(deactivationAccount)
				.build();
	}
}

package com.mid.alcohol.dto;

import java.time.LocalDateTime;

import com.mid.alcohol.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentAdressModifyDto {

	private String userName;
<<<<<<< HEAD
	private String userNickname;
=======
	private String userNickName;
>>>>>>> Dahan12
	private LocalDateTime userBirthday;
	private int userAge;
	private String userGender;
	private String userPassword;	
	private String userPasswordCheck;
	private String userAddress;
	private String userPhone;
	private String userEmail;
	private LocalDateTime userJoindate;
	
	public static PaymentAdressModifyDto fromEntity(User entity) {
		return PaymentAdressModifyDto.builder()
				.userName(entity.getUserName())
<<<<<<< HEAD
				.userNickname(entity.getUserNickname())
=======
				.userNickName(entity.getUserNickname())
>>>>>>> Dahan12
				.userBirthday(entity.getUserBirthday())
				.userAge(entity.getUserAge())
				.userGender(entity.getUserGender())
				.userPassword(entity.getUserPassword())
				.userPasswordCheck(entity.getUserPasswordCheck())
				.userAddress(entity.getUserAddress())
				.userPhone(entity.getUserPhone())
				.userEmail(entity.getUserEmail())
				.userJoindate(entity.getUserJoindate())
				.build();
	}
<<<<<<< HEAD
}
=======
}
>>>>>>> Dahan12

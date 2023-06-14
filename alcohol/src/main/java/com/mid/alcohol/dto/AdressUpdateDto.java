<<<<<<< HEAD
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
=======
//package com.mid.alcohol.dto;
//
//import com.mid.alcohol.domain.Payment;
//
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Builder
//public class AdressUpdateDto {
//	private String order_id;
//	private String order_name;
//	private String order_adress;
//	private String order_phone;
//	private String order_email;
//	
//	public Payment toEntity() {
//		return Payment.builder()
//				.order_id(order_id)
////				.order_name(order_name)
//				.order_adress(order_adress)
//				.order_phone(order_phone)
//				.order_email(order_email)
//				.build();
//	}
//}
>>>>>>> Dahan12

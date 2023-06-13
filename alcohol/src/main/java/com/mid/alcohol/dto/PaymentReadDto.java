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
//@Builder
//@AllArgsConstructor
//@NoArgsConstructor
//public class PaymentReadDto {
//	// 결제창에서 회원 기본 정보 불러오기 기본 값
//	private String order_name;
//	private String order_adress;
//	private String order_phone;
//	private String order_email;
//	
//	public static PaymentReadDto fromEntity(Payment entity) {
//		
//		return PaymentReadDto.builder()
//				.order_name(entity.getOrder_name())
//				.order_adress(entity.getOrder_adress())
//				.order_phone(entity.getOrder_phone())
//				.order_email(entity.getOrder_email())
//				.build();
//	}
//}

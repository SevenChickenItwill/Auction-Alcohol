package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PaymentCheck {
	// 	주문/결제 내역 확인 페이지 사용
	private int count; // 상품 수량
	private String productInfo; // 상품 정보
	private String productPrice; // 상품 가격
	private String deliveryFee; // 배송비
	private String totalPrice; // 총 결제한 금액
}

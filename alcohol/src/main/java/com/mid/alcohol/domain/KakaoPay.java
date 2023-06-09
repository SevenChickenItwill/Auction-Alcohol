package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPay {
	// KakaoPayApprovalVO
	private String cid;			// 가맹점 코드 MAX 10
	private String partner_order_id;	// 가맹점 주문번호 MAX100
	private String partner_user_id;	// 가맹점 회원 id MAX100
	private String item_name;	// 상품명 MAX100
	private int quantity;		// 상품 수량
	private int total_amount;	// 상품 총액
	private int tax_free_amount;	// 상품 비과세 금액
	private String approval_url; 	// 결제 성공 시 redirect, MAX255
	private String cancel_url;	// 결제 취소 시 redirect, MAX255
	private String fail_url;	// 결제 실패 시 redirect, MAX255
	
}

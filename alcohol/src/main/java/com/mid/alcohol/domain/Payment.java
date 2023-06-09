package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	private String order_id; // 주문자 아이디
	private String order_name; // 주문자 이름
    private String order_phone;	// 주문자 핸드폰 번호
    private String order_adress; // 주문자 주소
    private String order_email; // 주문자 이메일
    private int product_price; // 상품 가격
    private int total_price; // 총 결제 금액
    private int product_quantity; // 상품 수량
    private String product_name;	// 상품 이름
    private String product_info;	// 상품 정보(간략한 설명)
    private int delivery_fee;	// 배송비
    private String card_number;  // 카드 번호
}

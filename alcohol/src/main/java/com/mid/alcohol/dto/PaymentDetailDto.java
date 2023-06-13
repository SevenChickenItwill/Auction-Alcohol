//package com.mid.alcohol.dto;
//
//import java.sql.Timestamp;
//
//import com.mid.alcohol.domain.Payment;
//
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//
//@Data
//@Builder
//@AllArgsConstructor
//public class PaymentDetailDto {
//	// 결제/주문한 내역 상세보기에서 사용하는 Dto
//	
//	private String seller_name; // 판매자	
//	private int product_quantity;	// 상품 수량
//	private String product_info;	// 상품 정보
//	private int product_price;	// 상품 가격
//	private int total_price;	// 총 결제 금액
//	private String order_name;	// 구매자
//	private Timestamp order_time;	//	상품 결제 날짜
//	
//	public static PaymentDetailDto fromEntity(Payment entity) {
//		return PaymentDetailDto.builder()
//				.seller_name(entity.getSeller_name())
//				.product_quantity(entity.getProduct_quantity())
//				.product_info(entity.getProduct_info())
//				.product_price(entity.getProduct_price())
//				.total_price(entity.getTotal_price())
//				.order_name(entity.getOrder_name())
//				.order_time(Timestamp.valueOf(entity.getOrder_time()))
//				.build();
//	}
//}

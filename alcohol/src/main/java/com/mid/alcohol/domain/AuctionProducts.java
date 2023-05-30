package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AuctionProducts {
    // 경매물품 테이블
    
    private int productId; // 상품코드
    private String pName; // 상품명
    private String category; // 분류
    private String constuctor; // 제조사(생산자)
    private String brandName; // 브랜드명
    private long cost; // 경매품 원가(매입가)
}
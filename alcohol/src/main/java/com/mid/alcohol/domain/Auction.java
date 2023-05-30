package com.mid.alcohol.domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class Auction {
    // 경매 테이블
    private int id; // 경매코드
    private int productId; // 경매상품 테이블 참조하는 상품코드
    private String aucioneer; // 경매 개최자
    private String bidder; // 입찰자
    private long passBid; // 즉시낙찰가
    private long nowBid; // 현재입찰가
    private long bidCount; // 입찰횟수
    private long successBid; // 낙찰확정가
    private LocalDateTime auctionStart; // 경매시작
    private LocalDateTime autionEnd; // 경매 종료
}
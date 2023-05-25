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

    private int number;
    private int productId;
    private String aucioneer;
    private String bidder;
    private long passId;
    private long nowBid;
    private long bidCount;
    private long successBid;
    private LocalDateTime auctionStart;
}

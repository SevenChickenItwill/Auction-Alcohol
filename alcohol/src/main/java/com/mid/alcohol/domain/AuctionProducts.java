package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AuctionProducts {
    
    private int productId;
    private String pName;
    private String category;
    private String constuctor;
    private String brandName;
    private long cost;
}

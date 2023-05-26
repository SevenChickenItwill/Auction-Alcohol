package com.mid.alcohol.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class SearchProductDto {
    
    private int productId;
    private int pName;
    private String constructor;
    private String brandName;
    private String category;
    private long cost;
    private String userId;
    
}

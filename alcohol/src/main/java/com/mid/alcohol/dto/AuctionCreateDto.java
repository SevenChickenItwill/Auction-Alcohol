package com.mid.alcohol.dto;

import com.mid.alcohol.domain.AuctionProducts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Slf4j
@Builder
public class AuctionCreateDto {

	private String userId;
	private String pName;
	private int category;
	private String constructor;
	private String brandname;
	private long cost;
	
	public AuctionProducts toEntity(){
		
		AuctionProducts product = AuctionProducts.builder().pName(pName).category(category).brandName(brandname).constructor(constructor).cost(cost).userId(userId).build();
		
		return product;
	}
	
}

package com.mid.alcohol.dto;

import java.util.List;

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
public class AuctionReadDto {

	private String userId;
	private int productId;
	private String pName;
	private int category;
	private String constructor;
	private String brandname;
	private long cost;
	
	public static AuctionReadDto FromEntity(AuctionProducts p){
		
		AuctionReadDto dto = AuctionReadDto.builder().productId(p.getProductId()).pName(p.getPName()).category(p.getCategory()).brandname(p.getBrandName()).constructor(p.getConstructor()).cost(p.getCost()).userId(p.getUserId()).build();
		
		
		
		return dto;
	}
	
}

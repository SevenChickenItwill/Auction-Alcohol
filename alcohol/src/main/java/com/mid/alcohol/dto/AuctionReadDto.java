package com.mid.alcohol.dto;

import java.util.List;

import com.mid.alcohol.domain.AuctionProducts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Data
@AllArgsConstructor
@NoArgsConstructor

@Slf4j
@Builder
public class AuctionReadDto {

	private String userid;
	private int productid;
	private String pname;
	private int category;
	private String constructor;
	private String brandname;
	private long cost;
	
	public static AuctionReadDto FromEntity(AuctionProducts p){
		log.info("FromEntity(product={})",p);
		AuctionReadDto dto = AuctionReadDto.builder().productid(p.getProductId()).pname(p.getPName()).category(p.getCategory()).brandname(p.getBrandName()).constructor(p.getConstructor()).cost(p.getCost()).userid(p.getUserId()).build();
		
		
		
		return dto;
	}
	
}

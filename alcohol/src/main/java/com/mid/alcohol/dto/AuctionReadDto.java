package com.mid.alcohol.dto;

import com.mid.alcohol.domain.AuctionProducts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
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
	
	public AuctionProducts toEntity() {
		return AuctionProducts.builder()
							.productId(productid)
							.pName(pname)
							.category(category)
							.brandName(brandname)
							.constructor(constructor)
							.cost(cost)
							.userId(userid)
							.build();
	}
	
	
}
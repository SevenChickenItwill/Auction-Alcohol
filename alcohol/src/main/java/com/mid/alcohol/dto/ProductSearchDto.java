package com.mid.alcohol.dto;

import com.mid.alcohol.domain.AuctionProducts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductSearchDto {

	private String userid;
	private String pname;
	
	public AuctionProducts toEntity() {
		
		return AuctionProducts.builder().userId(userid).pName("%"+pname+"%").build();
		
	}
	
}

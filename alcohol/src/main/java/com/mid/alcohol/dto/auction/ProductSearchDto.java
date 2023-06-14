package com.mid.alcohol.dto.auction;

import com.mid.alcohol.domain.auction.AuctionProducts;

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

	private int productid;
	
	public AuctionProducts toEntity(int check) {
		
		if(check == 1) {
			
			return AuctionProducts.builder().userId(userid).pName(pname).productId(productid).build();
			
		}
		
		
		return AuctionProducts.builder().userId(userid).pName("%"+pname+"%").productId(productid).build();
		
	}
	
}


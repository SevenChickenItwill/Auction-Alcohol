package com.mid.alcohol.dto.shop;

import com.mid.alcohol.dto.auction.AuctionCreateDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ShopDto {
	private int pid;
	private String productname;
	private String standard;
	private String unit;
	private int price;
	private String brand;
	private String userid;
	private String expirationdate;
	private int alchol_level;
	private String hashtag;
	private String photopath;
	private int category;
	
	

}

package com.mid.alcohol.dto.shop;

import com.mid.alcohol.domain.shop.Products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShopDetailDto {

	private long pid;
	private String productname;
	private String standard;
	private String unit;
	private long price;
	private String brand;
	private String userid;
	private String expirationdate;
	private double alcohol_level;
	private String hashtag;
	private String photopath;
	private int category;
	
	public static ShopDetailDto FromEntity(Products p) {
		
		return ShopDetailDto.builder().pid(p.getPid()).productname(p.getProductname())
				.standard(p.getStandard()).unit(p.getUnit()).price(p.getPrice())
				.brand(p.getBrand()).userid(p.getUserid()).expirationdate(p.getExpirationdate())
				.alcohol_level(p.getAlcohol_level()).hashtag(p.getHashtag()).photopath(p.getPhotopath())
				.category(p.getCategory()).build();
		
	}
	
}

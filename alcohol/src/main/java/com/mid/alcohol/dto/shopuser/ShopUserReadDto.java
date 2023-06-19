package com.mid.alcohol.dto.shopuser;


import com.mid.alcohol.domain.shop.Products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ShopUserReadDto {
	private long pid;	
	private String productname; // 상품 이름
	private String standard;	// 상품 용량
	private String unit;	// 규격
	private long price;		// 상품 가격
	private String brand;	// 상품 브랜드
	private String userid;	// 사용자 아이디
	private String expirationdate;	// 유통기한
	private double alcohol_level;	//	도수
	private String hashtag;		
	private String photopath;	// 이미지
	private int category;	
	
	public static ShopUserReadDto fromEntity(Products entity) {
		return ShopUserReadDto.builder()
				.productname(entity.getProductname())
				.standard(entity.getStandard())
				.unit(entity.getUnit())
				.price(entity.getPrice())
				.brand(entity.getBrand())
				.userid(entity.getUserid())
				.expirationdate(entity.getExpirationdate())
				.alcohol_level(entity.getAlcohol_level())
				.hashtag(entity.getHashtag())
				.photopath(entity.getPhotopath())
				.category(entity.getCategory())
				.build();
				
	}
}

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
public class ShopUserSearchDto {
	
	private String productname; // 상품 이름
	private String brand;	// 상품 브랜드
	
	public static ShopUserSearchDto fromEntity(Products entity) {
		return ShopUserSearchDto.builder()
				.productname(entity.getProductname())
				.brand(entity.getBrand())
				.build();
				
	}
}

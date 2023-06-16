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
public class ShopProductCreateDto {

	private String productname;
	private String standard;
	private String unit;
	private long price;
	private String brand;
	private String userid;
	private String expirationdate;
	private double alcohol_level;
	private String hashtag;
	private int category;
	private String photopath;
	
	public Products toEntity() {
		
		return Products.builder().productname(productname).alcohol_level(alcohol_level).brand(brand).expirationdate(expirationdate).hashtag(hashtag).photopath(photopath).price(price).standard(standard).unit(unit).userid(userid).category(category).build();
		
	}
	
}

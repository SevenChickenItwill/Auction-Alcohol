package com.mid.alcohol.dto.shop;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShopSearchDto {

	private String userid; // 유저 닉네임
	private String search; // 검색어
	private int option; // 검색옵션 
	
	public void toWildCard() {
		
		this.search = "%" + search + "%";
		
	}
	
}

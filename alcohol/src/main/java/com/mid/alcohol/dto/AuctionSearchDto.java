package com.mid.alcohol.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuctionSearchDto {

	private String userid;
	private String searchtext;
	
	public void toSearch() {
		
		if(searchtext==null) {
			searchtext="";
		}
		searchtext = "%" + searchtext + "%";
		
	}
	
}

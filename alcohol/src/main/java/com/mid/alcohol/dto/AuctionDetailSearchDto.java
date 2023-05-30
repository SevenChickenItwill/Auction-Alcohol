package com.mid.alcohol.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuctionDetailSearchDto {

	private String userid;
	private String searchText;
	private Timestamp auctionstart;
	private Timestamp auctionend;
	private int category;
	private int status;
	
}

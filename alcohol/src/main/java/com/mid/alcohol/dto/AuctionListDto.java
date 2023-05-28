package com.mid.alcohol.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuctionListDto {

	private String auctionName;
	private String pname;
	private String constructor;
	private String brandname;
	private String category;
	private long passbid;
	private Timestamp auctionStart;
	private Timestamp auctionEnd;
	private long nowbid;
	private int productId;
	private int bidcount;
	private int status;
	private String bidder;
	private String auctioneer;
	private long successbid;
	
	
	
}

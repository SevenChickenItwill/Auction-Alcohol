package com.mid.alcohol.dto.auction;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;

import com.mid.alcohol.service.AuctionProductService;
import com.mid.alcohol.service.AuctionService;

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
	private int category;
	private long passbid;
	private Timestamp auctionStart;
	private Timestamp auctionEnd;
	private long nowbid;
	private int aid;
	private int productId;
	private int bidcount;
	private int status;
	private String bidder;
	private String auctioneer;
	private long successbid;
	
	
	
	
}

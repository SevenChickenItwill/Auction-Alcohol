package com.mid.alcohol.dto.auction;

import java.time.LocalDateTime;

import com.mid.alcohol.domain.auction.Auction;

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
public class AuctionOpenDto {

	private String auctionName;
	private String auctioneer;
	private String pname;
	private String constructor;
	private String brandname;
	private String category;
	private long passbid;
	private LocalDateTime auctionStart;
	private LocalDateTime auctionEnd;
	private long nowbid;
	private int productId;
	private int status;
	
	
	public Auction toEntity() {
		
		Auction auction = Auction.builder().auctioneer(auctioneer).auctionName(auctionName).productId(productId).passBid(passbid).nowBid((passbid/10)*3).auctionStart(auctionStart).auctionEnd(auctionEnd).bidder(auctioneer).status(status).build();
		
		return auction;
	}
	
	
}

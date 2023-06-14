package com.mid.alcohol.dto.auction;

import com.mid.alcohol.domain.auction.Auction;
import com.mid.alcohol.domain.auction.Chat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ChatInputDto {
	
	private long cid;
	private String userid;
	private String conversation;
	private String bidder;
	private long bidcount;
	private long nowbid;
	private int status;
	
	
	public Chat toEntity() {
		
		return Chat.builder().cid(cid).userid(userid).conversation(conversation).texttype(0).build();
		
	}
	
	public Auction toAuctionEntity() {
		
		return Auction.builder().aid((int)cid).bidCount(bidcount).nowBid(nowbid).bidder(bidder).status(status).build();
		
	}
	
}

package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Auction;
import com.mid.alcohol.domain.Chat;

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
	
	
	public Chat toEntity() {
		
		return Chat.builder().cid(cid).userid(userid).conversation(conversation).texttype(0).build();
		
	}
	
	public Auction toAuctionEntity() {
		
		return Auction.builder().aid((int)cid).bidCount(bidcount).nowBid(nowbid).bidder(bidder).build();
		
	}
	
}

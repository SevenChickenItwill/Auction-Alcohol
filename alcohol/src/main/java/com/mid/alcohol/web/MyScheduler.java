package com.mid.alcohol.web;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mid.alcohol.domain.auction.Auction;
import com.mid.alcohol.domain.auction.UserAuction;
import com.mid.alcohol.repository.AuctionRepository;
import com.mid.alcohol.service.AuctionService;
import com.mid.alcohol.service.AuctionUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MyScheduler {

	
	@Autowired
	private AuctionRepository auctionrepository;

	@Autowired
	private AuctionService auctionservice;
	
	@Autowired
	AuctionUserService userservice;
	
	@Scheduled(fixedRate = 60000)
	public void updateStatus() {
		Timestamp now = Timestamp.valueOf(LocalDateTime.now());
		log.info("updateStatus({})",now);
		auctionrepository.updateStatus(now);
		
	}
	
	@Scheduled(fixedRate = 60000)
	public void updateStart() {
		Timestamp now = Timestamp.valueOf(LocalDateTime.now());
		log.info("updateStart({})",now);
		auctionrepository.updateStart(now);
		
		List<Auction> list = auctionrepository.readAuctionStatus();
		List<UserAuction> list2 = auctionrepository.selectAllRoom();
		int count = 0;
		for(Auction x : list) {
			
			for(UserAuction y : list2) {
				
				if(x.getAid()==y.getCid()) {
					count++;
				}
				
			}
			
			if(count==0) {
				auctionrepository.automakeRoom(UserAuction.builder().cid(x.getAid()).chatroom(x.getAuctionName()).membercount(0).build());
			}
			count=0;
		}
		
	}
	
	
	
}

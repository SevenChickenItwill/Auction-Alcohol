package com.mid.alcohol.web;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mid.alcohol.repository.AuctionRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MyScheduler {

	
	@Autowired
	private AuctionRepository auctionrepository;

	@Scheduled(fixedRate = 1000)
	public void updateStatus() {
		Timestamp now = Timestamp.valueOf(LocalDateTime.now());
		log.info("updateStatus({})",now);
		auctionrepository.updateStatus(now);
		
	}
	
	@Scheduled(fixedRate = 1000)
	public void updateStart() {
		Timestamp now = Timestamp.valueOf(LocalDateTime.now());
		log.info("updateStart({})",now);
		auctionrepository.updateStart(now);
	}
	
}

package com.mid.alcohol.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.AuctionProducts;

@Repository
public interface AuctionProductRepository {

	int write(AuctionProducts product);
	
	List<AuctionProducts> read(String userId);
	
	AuctionProducts readAt(int productId);
}

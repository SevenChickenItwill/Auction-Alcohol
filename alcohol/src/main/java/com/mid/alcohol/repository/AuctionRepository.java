package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.AuctionProducts;


public interface AuctionRepository {
    
    List<AuctionProducts> selectByPName(AuctionProducts product);
}
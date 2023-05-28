package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Auction;
import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.dto.SearchProductDto;

public interface AuctionRepository {
    
    List<AuctionProducts> selectByPName(AuctionProducts product);
    
    AuctionProducts selectByPNameOne(AuctionProducts product);

	int writeAuction(Auction entity);

	List<AuctionListDto> readAuctionList(String userid);
}

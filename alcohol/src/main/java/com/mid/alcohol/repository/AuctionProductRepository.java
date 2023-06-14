package com.mid.alcohol.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.auction.AuctionProducts;
import com.mid.alcohol.domain.auction.Photo;
import com.mid.alcohol.dto.auction.AuctionReadDto;

@Repository
public interface AuctionProductRepository {

	int write(AuctionProducts product);
	
	List<AuctionProducts> read(String userId);
	
	AuctionProducts readAt(int productId);

	int deleteByProductId(int productid);


	int updateProduct(AuctionProducts entity);

	List<AuctionReadDto> readDetail(AuctionProducts entity);

	int deleteBeforePhoto(int productid);

	int uploadPhoto(Photo photo);
	
	Photo selectPhoto(int productid);
}

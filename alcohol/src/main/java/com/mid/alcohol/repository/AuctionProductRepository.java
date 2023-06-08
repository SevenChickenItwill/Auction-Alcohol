package com.mid.alcohol.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.domain.Photo;
import com.mid.alcohol.dto.AuctionReadDto;

@Repository
public interface AuctionProductRepository {

	int write(AuctionProducts product);
	
	List<AuctionProducts> read(String userId);
	
	AuctionProducts readAt(int productId);

	int deleteByProductId(int productid);


	int updateProduct(AuctionProducts entity);

	List<AuctionReadDto> readDetail(AuctionProducts entity);

	int savePhotoPath(Photo photo);
}

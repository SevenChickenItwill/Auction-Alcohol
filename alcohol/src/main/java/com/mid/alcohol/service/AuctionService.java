package com.mid.alcohol.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.dto.ProductSearchDto;
import com.mid.alcohol.repository.AuctionProductRepository;
import com.mid.alcohol.repository.AuctionRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AuctionService {

	@Autowired
	private AuctionProductRepository acprepository;
	
	@Autowired
	private AuctionRepository auctionrepository;
	
	public List<AuctionProducts> search(ProductSearchDto dto){
		
		if(dto.getPname().length()==0) {
			
			return new ArrayList<AuctionProducts>();
			
		}
		
		log.info("serach(dto={})");
		
		AuctionProducts product = dto.toEntity();
		
		return auctionrepository.selectByPName(product);
		
	}
	
}
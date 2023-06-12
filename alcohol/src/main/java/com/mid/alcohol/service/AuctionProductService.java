package com.mid.alcohol.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.domain.Photo;
import com.mid.alcohol.dto.AuctionCreateDto;
import com.mid.alcohol.dto.AuctionReadDto;
import com.mid.alcohol.repository.AuctionProductRepository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;


@Service
@Data
@Slf4j
public class AuctionProductService {

	@Autowired
	private final AuctionProductRepository auctionpdrepository;
	
	
	public int write(AuctionCreateDto dto) {
		
		AuctionProducts product = dto.toEntity();
		
		
		log.info("write={}",product);
		//TODO setUserId 대신 회원가입,로그인 완성되면,
		// 세션 정보 받아서 바로 들어가도록.
		
		return auctionpdrepository.write(product);
		
	}
	
	public List<AuctionReadDto> read(String userId){
		log.info("read(id = {})",userId);
		
		return auctionpdrepository.read(userId).stream().map(AuctionReadDto::FromEntity).toList();
	}

	public AuctionProducts readProduct(int productId) {
		log.info("readProduct(userid={})", productId);
		
		
		
		return auctionpdrepository.readAt(productId);
	}

	public AuctionReadDto read(int productid) {
		
	    AuctionProducts product = auctionpdrepository.readAt(productid);
	    
	    AuctionReadDto dto = AuctionReadDto.FromEntity(product);
	    
		return dto;
	}

	public int delete(int productid) {
		
		int result = auctionpdrepository.deleteByProductId(productid);
		return result;
	}

	public int updateProduct(AuctionReadDto dto) {
		
		int result = auctionpdrepository.updateProduct(dto.toEntity());
		return result;
	}

	public List<AuctionReadDto> readDetail(AuctionReadDto dto) {
		
		log.info("service readDetail(dto={})", dto);
		
		AuctionProducts entity = dto.toEntity();
		log.info("service entity={}", entity);
		entity.toWildcard(entity);
		
		return auctionpdrepository.readDetail(entity);
	}

	public int savePhotoPath(String filepath, int productid) {
		// TODO Auto-generated method stub
		
		log.info("savePhotoPath({})",filepath);
		
		Photo photo = Photo.builder().productid(productid).filepath(filepath).build();
		
		return auctionpdrepository.savePhotoPath(photo);
	}
	
}

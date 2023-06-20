package com.mid.alcohol.test;

import java.util.List;
import java.util.Random;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.mid.alcohol.dto.auction.AuctionCreateDto;
import com.mid.alcohol.dto.auction.AuctionReadDto;
import com.mid.alcohol.dto.shop.ShopProductCreateDto;
import com.mid.alcohol.repository.AuctionProductRepository;
import com.mid.alcohol.service.AuctionProductService;
import com.mid.alcohol.service.ShopService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/application-context.xml"}
        )
public class RepositoryTest {

	@Autowired
	private AuctionProductRepository respository;
	@Autowired
	private AuctionProductService service;
	@Autowired
	private ShopService shopservice;
	
	@Test
	public void writeshop() {
		
		log.info("write()");
		int count = 0;
		for(int i = 0 ; i<100 ; i++) {
		shopservice.createPd(ShopProductCreateDto.builder().alcohol_level(15.5).brand("대한주류"+count).category(new Random().nextInt(1,13)).expirationdate("2일 이내 섭취").hashtag("설명").photopath("C:\\imgs\\defaultimg.jpg").price(100*count).productname("맛있는전통술"+count).standard("355ml").unit("EA").userid("김돗개").build());
		count++;
		}
	}
	
//	@Test
	public void write() {
		log.info("write()");
		AuctionCreateDto dto = AuctionCreateDto.builder().userId("admin").pName("증류주").cost(10000).category(1).brandname("다한주류").constructor("(주)대동강맥주").build();
		log.info("dto = {}",dto);		
		
		int result = respository.write(dto.toEntity());
		
		
		log.info("write count = {}",result);
	}
	
//	@Test
	public void read() {
		log.info("read()");
		List<AuctionReadDto> list = service.read("test");
		Assertions.assertNotNull(list);
		
		log.info("{}",list);
		
		
	}
	
}

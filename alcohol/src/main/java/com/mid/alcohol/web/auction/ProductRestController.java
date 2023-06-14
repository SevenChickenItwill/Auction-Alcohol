package com.mid.alcohol.web.auction;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.auction.AuctionProducts;
import com.mid.alcohol.dto.auction.AuctionReadDto;
import com.mid.alcohol.service.AuctionProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/product")
public class ProductRestController {
	
	private final AuctionProductService auctionProductService;
	
	@GetMapping("/all/{userid}")
	public ResponseEntity<List<AuctionReadDto>> readAll(@PathVariable String userid) {
		log.info("readAll(userid={})", userid);
		
		List<AuctionReadDto> list = auctionProductService.read(userid);
		
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("/{productid}")
	public ResponseEntity<AuctionProducts> read(@PathVariable int productid) {
		log.info("read(productid={})", productid);
		
		AuctionProducts product = auctionProductService.readProduct(productid);
		
		return ResponseEntity.ok(product);
	}
	
	@PostMapping("/detailsearch")
	public ResponseEntity<List<AuctionReadDto>> readDetail(@RequestBody AuctionReadDto dto) {
		log.info("readDetail(dto={})", dto);
		
		List<AuctionReadDto> list = auctionProductService.readDetail(dto);
		for (AuctionReadDto x : list) {
			log.info("x=", x);
		}
		return ResponseEntity.ok(list);
	}
}

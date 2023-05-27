package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.dto.ProductSearchDto;
import com.mid.alcohol.service.AuctionService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/api/auction")
public class AuctionRestController {
    
	@Autowired
	private AuctionService acservice;
	
	@PostMapping("/product/{userid}")
	public ResponseEntity<List<AuctionProducts>> searchProduct(@RequestBody ProductSearchDto dto, @PathVariable String userid ) {
		log.info("searchProduct(data = {}, userid = {})",dto,userid);
		
		List<AuctionProducts> list = acservice.search(dto);
		
		return ResponseEntity.ok(list);
		
	}
	
}

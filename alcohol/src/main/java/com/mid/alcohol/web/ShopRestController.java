package com.mid.alcohol.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shop.ShopPhotoDto;
import com.mid.alcohol.dto.shop.ShopSearchDto;
import com.mid.alcohol.service.ShopService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/api/shop")
public class ShopRestController {

	@Autowired
	private ShopService shopservice;
	
	@PostMapping("/search")
	public ResponseEntity<List<Products>> searchlist(ShopSearchDto dto){
		log.info("searchlist(dto={})",dto);
		List<Products> list = shopservice.searchlist(dto);
		log.info("list={}",list);
		
		return ResponseEntity.ok(list);
		
	}
	private static String path = "C:\\imgs\\";
	@PostMapping("/upload")
	public ResponseEntity<String> uploadimg(@RequestBody MultipartFile file){
		UUID uid = UUID.randomUUID();
		String name = uid+file.getOriginalFilename();
		String photopath = path+name;
		String base64 = "";
		log.info(photopath);
		File files = new File(photopath);
		try {
			file.transferTo(files);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		log.info("file upload complete");
		
		return ResponseEntity.ok(photopath);
	}
	
	@PostMapping("/loadimg")
	public ResponseEntity<String> loadimg(@RequestBody ShopPhotoDto dto){
		log.info("loadimg");
		
		String result = "";
		try {
			result = shopservice.listToTagImage(shopservice.resizeImage(dto.getName()));
			log.info("result = {}",result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return ResponseEntity.ok(result);
		
	}
	
}

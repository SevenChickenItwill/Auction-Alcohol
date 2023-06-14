package com.mid.alcohol.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.domain.Photo;
import com.mid.alcohol.dto.AuctionDetailSearchDto;
import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.dto.AuctionReadDto;
import com.mid.alcohol.dto.ChatInputDto;
import com.mid.alcohol.dto.ChatListDto;
import com.mid.alcohol.dto.ChatRoomDto;

import com.mid.alcohol.dto.ProductSearchDto;
import com.mid.alcohol.service.AuctionProductService;
import com.mid.alcohol.service.AuctionService;
import com.mid.alcohol.service.AuctionUserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/api/auction")
public class AuctionRestController {
    
	@Autowired
	private AuctionUserService userservice;
	
	@Autowired
	private AuctionService acservice;

	@Autowired
	private AuctionProductService productservice;
	
	@PostMapping("/product/{userid}")
	public ResponseEntity<List<AuctionProducts>> searchProduct(@RequestBody ProductSearchDto dto, @PathVariable String userid ) {
		log.info("searchProduct(data = {}, userid = {})",dto,userid);
		
		List<AuctionProducts> list = acservice.search(dto);
		log.info("{}",list);
		
		return ResponseEntity.ok(list);
		
	}
	

	@PostMapping("/info/{userid}")
	public ResponseEntity<AuctionReadDto> infoProduct(@RequestBody ProductSearchDto dto, @PathVariable String userid){
		
		log.info("infoProduct()");
		
		AuctionReadDto readdto = acservice.read(dto);
		log.info("readdto = {}",readdto);
		
		
		
		return ResponseEntity.ok(readdto);
	}
	
	@PostMapping("/detail/{userid}")
	public ResponseEntity<List<AuctionListDto>> detailList(@RequestBody AuctionDetailSearchDto dto, @PathVariable String userid){
		log.info("DetailList(dto={}, userid={})",dto,userid);
		
		List<AuctionListDto> detailList = acservice.searchDetail(dto);
		log.info("result = {}",detailList);
		
		return ResponseEntity.ok(detailList);
	}
	
	@PostMapping("/send/{aid}/{userid}")
	public ResponseEntity<Integer> sendchat(@RequestBody ChatInputDto dto){
		log.info("sendchat(dto= {})", dto);
		
		
		int result = acservice.updatebat(dto);
		
		int result2 = userservice.createChatContent(dto);
		
		return ResponseEntity.ok(result);
		
		
	}
	
	@GetMapping("/refresh/{status}")
	public ResponseEntity<List<AuctionListDto>> refreshChat(@PathVariable int status){
		
		log.info("refreshChat()");
		List<AuctionListDto> list;
		
		if(status == 1) {
			list = acservice.readInglist();
		} else if(status == 2) {
			list = acservice.readEndlist();
		} else {
			list = acservice.readAlllist();
		}
		
		return ResponseEntity.ok(list);
	}
	
	
	
	private static String path = "C:\\mid-pj\\middlePj\\alcohol\\src\\main\\webapp\\static\\image\\";
	@PostMapping("/upload/{productid}")
	public ResponseEntity<String> uploadimg(@RequestBody MultipartFile file, @PathVariable int productid){
		log.info("uploadimg()");
		int result = 0;
		UUID uid = UUID.randomUUID();
		String name = uid+file.getOriginalFilename();
		String photopath = path+name;
		String base64 = "";
		log.info(photopath);
		try {
			File files = new File(photopath);
			file.transferTo(files);
			
			log.info("file upload complete");
			
			Photo photo = Photo.builder().productid(productid).photopath(photopath).build();
			int result2 = productservice.deleteBeforePhoto(productid);
			log.info("{} 개 사진이 삭제되었습니다.",result2);
			
			result = productservice.uploadPhoto(photo);
			
			base64 = productservice.listToTagImage(productservice.resizeImage(photopath));
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return ResponseEntity.ok(base64);
		
	}


	
	
	
}


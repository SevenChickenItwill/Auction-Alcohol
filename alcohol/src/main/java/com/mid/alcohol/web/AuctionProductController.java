package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.dto.AuctionCreateDto;
import com.mid.alcohol.dto.AuctionReadDto;
import com.mid.alcohol.service.AuctionProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
public class AuctionProductController {

	@Autowired
	private AuctionProductService apservice;
	
	@GetMapping("/product")
	public String productManage(Model model) {
		log.info("ProductManage");
		
		// 아이디 값 받으면 불러와야함
		List<AuctionReadDto> list =  apservice.read("test");
		log.info("list={}",list);
		model.addAttribute("productlist", list );
		
		return "auction/productmanage";
	}
	
	@GetMapping("/productcreate")
	public String productCreate() {
		log.info("ProductCreate()");
		
		return "auction/productcreate";
	}
	
	@PostMapping("/createsuccess")
	public String productCreate(AuctionCreateDto dto) {
		log.info("dto={}",dto);
		// 서비스로 product dto 객체 전달 필요.
		apservice.write(dto);
		
		
		
		return "redirect:/auction/product";
	}
	
	
	
}

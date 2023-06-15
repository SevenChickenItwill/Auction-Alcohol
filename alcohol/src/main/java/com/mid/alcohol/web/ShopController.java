package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shop.ShopProductCreateDto;
import com.mid.alcohol.service.ShopService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopservice;
	
	@GetMapping("/pdlist")
	public void pdlist(Model model) {
		
		log.info("pdlist()");
		
		List<Products> list = shopservice.productall(); 
		
		model.addAttribute(list);
		log.info("{}",list);
		
	}
	
	@GetMapping("/pdcreate")
	public void pdcreate() {
		
		log.info("pdcreate()");
		
		
		
	}
	
	@PostMapping("/pdcreate")
	public String pdcreateclear(ShopProductCreateDto dto) {
		
		log.info("pdcreateclear()");
		
		int result = shopservice.createPd(dto);
		log.info("{} row add complete");
		
		return "/shop/pdlist";
	}
	
	
	
}

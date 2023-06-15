package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {

	@GetMapping("shopmain")
	public void shopMainPage(Model model) {
		log.info("shopMain()");
	}
	
	@GetMapping("shopdetail")
	public void shopDetail(Model model) {
		log.info("shopDetail()");
	}
	
}

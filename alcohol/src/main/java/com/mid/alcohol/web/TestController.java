package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
public class TestController {

	
	@GetMapping("/product")
	public String productManage() {
		log.info("ProductManage");
		
		return "auction/productmanage";
	}
	
	@GetMapping("/product/create")
	public String productCreate() {
		log.info("ProductCreate()");
		
		return "auction/productcreate";
	}
	
}

package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;



@Controller
@RequestMapping("/auction")
@Slf4j
public class AuctionUserController {
	
	@GetMapping("/mainsite")
	public String usermain() {
		
		log.info("usermain()");
		
		return "/auction/auction-userpage";
	}
}

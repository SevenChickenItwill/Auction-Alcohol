package com.mid.alcohol.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PayHomeController {
	
	    @GetMapping("/paymain")
	    public String home() {    	
	        log.info("home()");
	        return "payindex";
	    }   	   
}

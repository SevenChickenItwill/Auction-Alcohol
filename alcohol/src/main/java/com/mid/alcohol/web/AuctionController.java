package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
public class AuctionController {

    @GetMapping("/auction")
    public void management() {
        log.info("management()");
        
        
    }
    
    @GetMapping("/registration")
    public void auctionRegistration() {
        
    }
    
    @PostMapping("/registration")
     public String registrationCompleted() {
        log.info("registrationCompleted()");
        
        return "/auction/auction";
    }
}

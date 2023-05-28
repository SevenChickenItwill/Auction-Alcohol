package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.dto.AuctionOpenDto;
import com.mid.alcohol.service.AuctionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
@RequiredArgsConstructor
public class AuctionController {

	@Autowired
	private final AuctionService aucservice;
	
    @GetMapping("/auction")
    public void management(Model model) {
        log.info("management()");
        
        List<AuctionListDto> list = aucservice.readlist("test");
        log.info("list = {}",list);
        model.addAttribute("auctionlist", list);
        
    }
    
    @GetMapping("/registration")
    public void auctionRegistration() {
        
    }
    
    @PostMapping("/registration")
     public String registrationCompleted(AuctionOpenDto dto) {
        log.info("registrationCompleted(dto={})",dto);
        
        int result = aucservice.write(dto);
        
        log.info("add row = {}",result);
        
        if(result==0) {
        	return "redirect:/auction/registration";
        }
        
        return "/auction";
    }
}

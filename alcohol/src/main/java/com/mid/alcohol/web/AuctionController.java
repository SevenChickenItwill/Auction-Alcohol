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
        
        return "redirect:/auction/auction";
    }
    
    // detail 페이지로 가기 위해 id 값과 auction키값 받기
    @GetMapping("/detail")
    public String auctiondetail(@RequestParam int aid, Model model) {
    	log.info("auctiondetail(aid={})",aid);
    	
    	AuctionListDto dto = aucservice.readOne(aid);
    	log.info("dto={}",dto);
    	model.addAttribute("detail",dto);
    	
    	return "/auction/auctiondetail";
    }
    
    @GetMapping("/modify")
    public void auctionModify(@RequestParam int aid, Model model) {
    	
    	log.info("auctionModify(aid={})",aid);
    	AuctionListDto dto = aucservice.readOne(aid);
    	log.info("dto={}",dto);
    	model.addAttribute("detail",dto);
    	
    	
    }
    
    @PostMapping("/update")
    public String auctionUpdate() {
    	log.info("auctionUpdate()");
    	
    	
    	return "redirect:/auction/detail";
    }
    
}

package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mid.alcohol.dto.auction.AuctionListDto;
import com.mid.alcohol.dto.auction.AuctionOpenDto;
import com.mid.alcohol.dto.auction.AuctionSearchDto;
import com.mid.alcohol.service.AuctionService;
import com.mid.alcohol.service.AuctionUserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
@RequiredArgsConstructor
public class AuctionController {

	@Autowired
	private final AuctionService aucservice;
	
	@Autowired
	private AuctionUserService userservice;
	
    @GetMapping("/auction")
    public void management(Model model,HttpSession session) {
        log.info("management()");
        
        List<AuctionListDto> list = aucservice.readlist((String) session.getAttribute("userNickname"));
        log.info("list = {}",list);
        model.addAttribute("auctionlist", list);
        
    }
    
    @PostMapping("/auction")
    public void searchList(Model model, AuctionSearchDto dto) {
    	log.info("searchtext(searchText={})",dto);
    	
    	List<AuctionListDto> list = aucservice.searchAuction(dto);
    	model.addAttribute("auctionlist",list);
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
    public String auctionModify(@RequestParam int aid, Model model) {
    	
    	log.info("auctionModify(aid={})",aid);
    	AuctionListDto dto = aucservice.readOne(aid);
    	log.info("dto={}",dto);
    	model.addAttribute("detail",dto);
    	
    	return "/auction/auctionmodify";
    }
    
    @PostMapping("/update")
    public String auctionUpdate(AuctionOpenDto dto,@RequestParam int aid ) {
    	log.info("auctionUpdate(dto={})",dto);
    	
    	
    	
    	int result = aucservice.update(dto,aid);
    	
    	log.info("update row={}",result);
    	
    	
    	return "redirect:/auction/detail?aid=" + aid;
    }
    
    @GetMapping("/delete")
    public String auctionDelete(@RequestParam long aid) {
    	log.info("aid={}",aid);
    	
    	int result = aucservice.delete(aid);
    	log.info("delete = {}",result);
    	result = userservice.deleteChatContent(aid);
    	
    	result = userservice.deleteChatRoom(aid);
    	log.info("deletechatRoom = {}",result);
    	
    	return "redirect:/auction/auction";
    }
    
}

package com.mid.alcohol.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.WebSocketSession;

import com.mid.alcohol.domain.Chat;
import com.mid.alcohol.domain.UserAuction;
import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.dto.ChatListDto;
import com.mid.alcohol.service.AuctionService;
import com.mid.alcohol.service.AuctionUserService;

import lombok.extern.slf4j.Slf4j;



@Controller
@RequestMapping("/auction")
@Slf4j
public class AuctionUserController {
	
	@Autowired
	private AuctionService aucservice;
	@Autowired
	private AuctionUserService userservice;
	
	@GetMapping("/mainsite")
	public String usermain(@RequestParam int aid, String auctionname, Model model) {
		log.info("usermain(aid={}, auctionname={})",aid,auctionname);
		
		AuctionListDto auctiondto = aucservice.readOne(aid);
		List<ChatListDto> chatdto = userservice.readChatDataOne(aid);
		
		
		model.addAttribute("list1", chatdto);
		model.addAttribute("list2",auctiondto);
		
		return "/auction/auction-userpage";
	}
	
	@GetMapping("/testmain")
	public void testmain() {
		
		
		
	}

	

}

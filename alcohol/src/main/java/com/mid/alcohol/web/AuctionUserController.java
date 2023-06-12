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

import jakarta.servlet.http.HttpSession;
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
	public String usermain(@RequestParam int aid, String auctionName, Model model) {
		log.info("usermain(aid={}, auctionname={})",aid,auctionName);
		
		AuctionListDto auctiondto = aucservice.readOne(aid);
		List<ChatListDto> chatdto = userservice.readChatDataOne(aid);
		log.info("list1 ={}", chatdto);
		
		model.addAttribute("list1", chatdto);
		model.addAttribute("list2",auctiondto);
		
		return "/auction/auction-userpage";
	}
	
	@GetMapping("/auctionview")
	public String userAuction(HttpSession session, Model model) {
		
		log.info("userAuction()");
		
		List<AuctionListDto> list = aucservice.readUserEnd((String)session.getAttribute("userNickname"));
		List<AuctionListDto> list2 = aucservice.readUserIng((String)session.getAttribute("userNickname"));
		// service로부터 아이디값에 포함된 경매 리스트만 불러오기
		log.info((String)session.getAttribute("userNickname"));
		
		log.info("list={}",list);
		log.info("list2={}",list2);
		model.addAttribute("myauction",list2);
		model.addAttribute("myauction2", list);
		
		return "/Userauction";
		
		
	}
	
	

	

}

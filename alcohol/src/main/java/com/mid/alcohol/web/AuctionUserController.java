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

import com.mid.alcohol.domain.auction.Chat;
import com.mid.alcohol.domain.auction.Photo;
import com.mid.alcohol.domain.auction.UserAuction;
import com.mid.alcohol.dto.auction.AuctionListDto;
import com.mid.alcohol.dto.auction.ChatListDto;
import com.mid.alcohol.dto.board.BulletinboardHistoryDto;
import com.mid.alcohol.dto.shop.ShopPaymentListDto;
import com.mid.alcohol.service.AuctionProductService;
import com.mid.alcohol.service.AuctionService;
import com.mid.alcohol.service.AuctionUserService;
import com.mid.alcohol.service.BulletinboardService;
import com.mid.alcohol.service.ShopService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;



@Controller
@RequestMapping("/auction")
@Slf4j
public class AuctionUserController {
	
	@Autowired
	BulletinboardService bulletinboardService;
	
	@Autowired
	private AuctionService aucservice;
	@Autowired
	private AuctionUserService userservice;
	
	@Autowired
	private AuctionProductService pdservice;
	
	@Autowired
	private ShopService shopservice;
	
	@GetMapping("/mainsite")
	public String usermain(@RequestParam int aid, String auctionName, Model model) {
		log.info("usermain(aid={}, auctionname={})",aid,auctionName);
		
		AuctionListDto auctiondto = aucservice.readOne(aid);
		List<ChatListDto> chatdto = userservice.readChatDataOne(aid);
		log.info("list1 ={}", chatdto);
		Photo photo = pdservice.selectPhoto(auctiondto.getProductId());
		String img = "";
		try {
			img = pdservice.listToTagImage(pdservice.resizeImage(photo.getPhotopath()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list1", chatdto);
		model.addAttribute("list2",auctiondto);
		model.addAttribute("image",img);
		
		return "/auction/auction-userpage";
	}
	
	@GetMapping("/auctionview")
	public String userAuction(HttpSession session, Model model) {
		
		log.info("userAuction()");
		
		List<AuctionListDto> list = aucservice.readUserEnd((String)session.getAttribute("userNickname"));
		List<AuctionListDto> list2 = aucservice.readUserIng((String)session.getAttribute("userNickname"));
		// service로부터 아이디값에 포함된 경매 리스트만 불러오기
		log.info((String)session.getAttribute("userNickname"));
		List<BulletinboardHistoryDto> dto = bulletinboardService.historyReadByBoardId((String)session.getAttribute("userNickname"));
		List<ShopPaymentListDto> list3 = shopservice.readPaymentListByUser((String)session.getAttribute("userNickname"));
		
		// 뷰에 BulletinBoardHistoryDto를 전달
		model.addAttribute("histories", dto);
		model.addAttribute("mypayment", list3);
		log.info("list={}",list);
		log.info("list2={}",list2);
		model.addAttribute("myauction",list2);
		model.addAttribute("myauction2", list);
		
		return "/Userauction";
		
		
	}
	
	

	

}

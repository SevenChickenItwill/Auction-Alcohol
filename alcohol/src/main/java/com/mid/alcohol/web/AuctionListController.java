package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.service.AuctionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/auction")
@RequiredArgsConstructor
public class AuctionListController {
	
	@Autowired
	private final AuctionService auctionservice;
	
	@GetMapping("/auctionlist")
	public void auctionList(Model model) {
		List<AuctionListDto> list = auctionservice.readAlllist();
		model.addAttribute("auctioninfo", list);
	}
}

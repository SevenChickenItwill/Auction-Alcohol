package com.mid.alcohol.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.domain.auction.Photo;
import com.mid.alcohol.dto.auction.AuctionListDto;
import com.mid.alcohol.dto.auction.AuctionListPhotoDto;
import com.mid.alcohol.service.AuctionProductService;
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
	
	@Autowired
	private AuctionProductService apservice;
	
	private static final String paths = "C:/imgs/defaultimg.png";
	
	@GetMapping("/auctionlist")
	public void auctionList(Model model) {
		List<AuctionListDto> list = auctionservice.readAlllist();
		
		List<AuctionListPhotoDto> list2 = new ArrayList<>();		
		
		for(int i = 0 ; i<list.size() ; i++) {
			
			Photo root = auctionservice.findphotoroot(list.get(i).getProductId());
			
			if(root == null) {
				
				root = new Photo();
				root.setPhotopath(paths);
				
			}
			list2.add(AuctionListPhotoDto.FromChange(list.get(i)));
			
			try {
				String imgs = apservice.listToTagImage(apservice.resizeImage(root.getPhotopath()));
				list2.get(i).setPhotopath(imgs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		model.addAttribute("auctioninfo", list2);
		model.addAttribute("status",3);
	}
	
	@GetMapping("/auctioninglist")
	public void auctionIngList(Model model) {
		List<AuctionListDto> list = auctionservice.readInglist();
		
List<AuctionListPhotoDto> list2 = new ArrayList<>();		
		
		for(int i = 0 ; i<list.size() ; i++) {
			
			Photo root = auctionservice.findphotoroot(list.get(i).getProductId());
			
			if(root == null) {
				
				root = new Photo();
				root.setPhotopath(paths);
				
			}
			
			list2.add(AuctionListPhotoDto.FromChange(list.get(i)));
			
			try {
				String imgs = apservice.listToTagImage(apservice.resizeImage(root.getPhotopath()));
				list2.get(i).setPhotopath(imgs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		model.addAttribute("auctioninfo", list2);
		
		model.addAttribute("status",1);
	}
	
	@GetMapping("/auctionendlist")
	public void auctionEndList(Model model) {
		List<AuctionListDto> list = auctionservice.readEndlist();
		
		List<AuctionListPhotoDto> list2 = new ArrayList<>();		
		
		for(int i = 0 ; i<list.size() ; i++) {
			
			Photo root = auctionservice.findphotoroot(list.get(i).getProductId());
			
			if(root == null) {
				
				root = new Photo();
				root.setPhotopath(paths);
				
			}
			
			list2.add(AuctionListPhotoDto.FromChange(list.get(i)));
			
			try {
				String imgs = apservice.listToTagImage(apservice.resizeImage(root.getPhotopath()));
				list2.get(i).setPhotopath(imgs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		model.addAttribute("auctioninfo", list2);
		
		model.addAttribute("status",2);
	}
}

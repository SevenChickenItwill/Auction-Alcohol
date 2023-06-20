package com.mid.alcohol.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.domain.shop.Products;
import com.mid.alcohol.dto.shop.AdminProductInfoDto;
import com.mid.alcohol.dto.shop.ShopDetailDto;
import com.mid.alcohol.dto.shop.ShopProductCreateDto;
import com.mid.alcohol.service.ShopService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopservice;
	
	@GetMapping("/pdlist")
	public void pdlist(Model model, HttpSession session) {
		
		log.info("pdlist()");
		String userid = (String) session.getAttribute("userNickname");
		List<Products> list = shopservice.productall(userid); 
		
		model.addAttribute("prolist",list);
		log.info("정상 실행");
		
	}
	
	@GetMapping("/pdcreate")
	public void pdcreate() {
		
		log.info("pdcreate()");
		
		
		
	}
	
	@PostMapping("/pdcreate")
	public String pdcreateclear(ShopProductCreateDto dto) {
		
		
		
		log.info("pdcreateclear()");
		
		int result = shopservice.createPd(dto);
		log.info("{} row add complete");
		
		return "redirect:/shop/pdlist";
	}
	
	@PostMapping("/pdmodify")
	public String pdmodifyclear(ShopDetailDto dto) {
		
		log.info("pdmodifyclear(pid={})",dto.getPid());
		
		int result = shopservice.updatepd(dto);
		log.info("update rows = {}",result);
		
		return "redirect:/shop/pdmodify?pid="+dto.getPid();
		
	}
	
	@GetMapping("/pdmodify")
	public void pdmodify(@RequestParam int pid, Model model) {
		log.info("pdmodify(pid={})",pid);
		 ShopDetailDto dto = shopservice.readdetail(pid);
		
		 model.addAttribute("detail",dto);
	}
	
	@GetMapping("/delete")
	public String pddelete(@RequestParam int pid) {
		log.info("pddelete({})",pid);
		int result = shopservice.deletepd(pid);
		
		return "redirect:/shop/pdlist";
	}
	
	@GetMapping("/pddetails")
	public String pddetail(long pid, Model model) {
		log.info("pddetail=({})", pid);
		
		ShopDetailDto dto = shopservice.readpd(pid);
		log.info("dto= {}", dto);
		
		model.addAttribute("product", dto);
		
		return "/shop/pddetails";
	}
	
	@GetMapping("/aproductinfo")
	public void adminProductInfo(Model model, HttpSession session) {
		String userNickname = (String) session.getAttribute("userNickname");
		List<AdminProductInfoDto> list = shopservice.getAdminProductInfoDto(userNickname);
		model.addAttribute("list", list);
	}
}

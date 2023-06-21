package com.mid.alcohol.web;

import java.io.File;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mid.alcohol.domain.auction.AuctionProducts;
import com.mid.alcohol.domain.auction.Photo;
import com.mid.alcohol.dto.auction.AuctionCreateDto;
import com.mid.alcohol.dto.auction.AuctionReadDto;
import com.mid.alcohol.service.AuctionProductService;
import com.mid.alcohol.service.AuctionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/auction")
public class AuctionProductController {

	@Autowired
	private AuctionProductService apservice;
	
	
	
	
	@GetMapping("/product")
	public String productManage(Model model, HttpSession session) {
		log.info("ProductManage");
		
		// 아이디 값 받으면 불러와야함
		List<AuctionReadDto> list =  apservice.read((String) session.getAttribute("userNickname"));
		log.info("list={}",list);
		model.addAttribute("productlist", list );
		
		return "auction/productmanage";
	}
	
	@GetMapping("/productcreate")
	public String productCreate() {
		log.info("ProductCreate()");
		
		return "auction/productcreate";
	}
	
	@PostMapping("/createsuccess")
	public String productCreate(AuctionCreateDto dto) {
		
		log.info("dto={}",dto);
		// 서비스로 product dto 객체 전달 필요.
		
		
		apservice.write(dto);
		
		
		
		return "redirect:/auction/product";
	}
	

	
	

	// create.jsp에서 productid를 받아와 해당 product를 찾아 모델에 넣고 productdtail.jsp에 보내준다 
	@GetMapping("/productdetail")
	public void productdetail(int productid, Model model) {
		AuctionReadDto dto = apservice.read(productid);
		
		model.addAttribute("product", dto);
	}
	
	@PostMapping("/productdelete")
	public String productDelete(int productid) {
		
		// 상품 삭제 시 사진 함께 삭제
		int result2 = apservice.deleteBeforePhoto(productid);
		log.info("{} 상품번호의 사진 삭제완료",productid);
		
		
		int result = apservice.delete(productid);
		log.info("삭제결과={}", result);
		if(result>=1) {
			return "redirect:/auction/product";
		} else {
			return "/auction/productdetail?productid="+productid;
		}
	}
	
	@PostMapping("/productmodify")
	public void productmodify(AuctionReadDto dto, Model model) {
		log.info("productmodify(dto={})", dto);
		model.addAttribute("product", dto);
	}
	
	@PostMapping("/productupdate")
	public String productUpdate(AuctionReadDto dto) {
		log.info("productUpdate(dto={}", dto);
		
		int result = apservice.updateProduct(dto);
		
		return "redirect:/auction/product";
	}
	
	
	

	

	
	

}

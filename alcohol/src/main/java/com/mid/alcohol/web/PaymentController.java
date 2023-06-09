package com.mid.alcohol.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.dto.AdressUpdateDto;

import com.mid.alcohol.dto.PaymentReadDto;
import com.mid.alcohol.dto.BasketListDto;

import com.mid.alcohol.service.PaymentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	
	
	@GetMapping("/paymentmain")
	public void read(@RequestParam String order_name, Model model) {
		log.info("read(order_name={})", order_name);
		
		PaymentReadDto dto = paymentService.read(order_name);
		
		model.addAttribute("payment", dto);
		log.info("run2()");
	}
	
	@GetMapping("/information")
	public void paymentInformation(Model model) {
		log.info("information()");
	}
	
	@GetMapping("/modify")
	public void adressModify(Model model, @RequestParam String order_name) {
		log.info("modify()");
		
		PaymentReadDto dto = paymentService.read(order_name);
		
		model.addAttribute("payment", dto);
		log.info("run3()");	
	}
	

	@GetMapping("/paymain")
	public void paymentMain(Model model) {
		
		
		log.info("paymentMain()");
	}
	
	@GetMapping("/detail")
	public void paymentDetail(String order_id, Model model) {
		log.info("paymentDetail(order_id={})", order_id);
		
	}
	
	@GetMapping("/update")
	public void update() {
		log.info("update()");
	}
	
	@PostMapping("/update")
	public String update(AdressUpdateDto dto) {
		log.info("update(dto={})", dto);
		
		int result = paymentService.update(dto);
		log.info("update = {}", result);
		
		return "redirect:/payment/paymentmain";
	}


}

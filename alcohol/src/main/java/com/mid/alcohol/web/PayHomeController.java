package com.mid.alcohol.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mid.alcohol.dto.BasketListDto;
import com.mid.alcohol.service.PaymentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class PayHomeController {

	@Autowired
	private final PaymentService paymentService;
	
	@GetMapping("/paymain")
    public String home(Model model) {    	
        log.info("home()");
        String userid = "test";
		
		List<BasketListDto> dto = paymentService.readBasketByUserid(userid);
		log.info("home(dto={})", dto);
		
		model.addAttribute("list", dto);
        return "payindex";
    }
	
	

}

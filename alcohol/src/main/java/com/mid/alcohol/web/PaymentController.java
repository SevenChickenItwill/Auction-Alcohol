package com.mid.alcohol.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("payment")
@RequiredArgsConstructor
public class PaymentController {
	
	@GetMapping("pay")
	public void paymentRead() {
		
	}
}

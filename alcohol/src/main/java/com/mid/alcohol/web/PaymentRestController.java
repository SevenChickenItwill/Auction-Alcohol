package com.mid.alcohol.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mid.alcohol.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/payment")
public class PaymentRestController {

	@Autowired
	private PaymentService paymentService;

	@DeleteMapping("/deletebasket/{basketid}")
	public ResponseEntity<Integer> deletebasket(@PathVariable int basketid) {
		log.info("deletebasket(basketid = {})", basketid);
		paymentService.deletebasket(basketid);
		return ResponseEntity.ok(1);
	}
}

package com.mid.alcohol.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mid.alcohol.dto.payment.AdressUpdateDto;
import com.mid.alcohol.dto.payment.OrderProductDto;
import com.mid.alcohol.dto.payment.PaymentAdressModifyDto;
import com.mid.alcohol.service.PaymentService;


import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
	
	@Autowired
	private HttpSession session;

	
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/paymentmain")
	public void paymentInfo(Model model, @RequestParam(name = "OrderProductDto") List<OrderProductDto> orderProductDto) {
		log.info("paymentInfoPost()");
		log.info(orderProductDto.toString());
	}
	
	@PostMapping("/updateDeliveryInfo")
	public String updateDeliveryInfo(AdressUpdateDto dto) {
		log.info("updateDeliveryInfo(dto={})", dto);
		
		int result = paymentService.update(dto);
		log.info("updateDeliveryInfo = {}", dto);
		return "redirect:/payment/paymentmain";

		/*
		String userNickname = (String)session.getAttribute("userNickname");
		paymentService.insertPayment(userNickname);
		int paymentid = paymentService.readPaymentList(userNickname);
		log.info(userNickname);
		
		ObjectMapper objectMapper = new ObjectMapper();
		List<OrderProductDto> orderProductDtoList = null;
		try {
			orderProductDtoList = objectMapper.readValue(orderProductDtoJson, new TypeReference<List<OrderProductDto>>() {});
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		for (OrderProductDto x : orderProductDtoList) {
			log.info(""+x);
		}
		
		for (OrderProductDto opdto : orderProductDtoList) {
			opdto.setUserNickname(userNickname);
			opdto.setPaymentid(paymentid);
			
		}
		paymentService.insertOrder(orderProductDtoList);
		PaymentAdressModifyDto dto = paymentService.read(userNickname);
		model.addAttribute("userinfo", dto);
		*/

	}
	
	@GetMapping("/paymentmain")
	public void paymentInfoGet(Model model) {
		log.info("paymentInfoGet()");
		String userNickname = (String)session.getAttribute("userNickname");
		log.info(userNickname);
		PaymentAdressModifyDto dto = paymentService.read(userNickname);
		model.addAttribute("userinfo", dto);
		
	}
	
	@GetMapping("/information")
	public void paymentInformation(Model model) {
		log.info("information()");
	}
	

	@GetMapping("/modify")
	public void adressModify(Model model) {
		log.info("modify()");
		
		String userNickname = (String) session.getAttribute("userNickname");
		log.info(userNickname);
		PaymentAdressModifyDto dto = paymentService.read(userNickname);
		
		model.addAttribute("user", dto);
		log.info("run3()");	
	}

	

	

	@GetMapping("/paymain")
	public void paymentMain(Model model) {
	
		log.info("paymentMain()");
	}
	
	
	
	
	
	@RequestMapping("/kakaopay.cls")
	@ResponseBody
	public String kakaopay() {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			try {
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK 57e7976b8b01733b8d39b2e982361037");
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true);
				String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:8081/alcohol/payment/paysuccess&fail_url=http://localhost:8081/alcohol/payment/payfail&cancel_url=http://localhost:8081/alcohol/payment/paycancel";
				OutputStream ops = connection.getOutputStream();
				DataOutputStream dops = new DataOutputStream(ops);
				dops.writeBytes(param);
				dops.close();
				
				int result = connection.getResponseCode();
				
				InputStream inputStream;
				if (result == 200) {
					inputStream = connection.getInputStream();
				} else {
					inputStream = connection.getErrorStream();
				}
				log.info("코드"+result);
				InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
				BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
				return bufferedReader.readLine();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	@GetMapping("/paysuccess")
	public void paysuccess() {}



	@GetMapping("/paycancel")
	public void paycancel() {}
	
	@GetMapping("/payfail")
	public void payfail() {}


}

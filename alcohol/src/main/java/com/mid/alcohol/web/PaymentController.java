package com.mid.alcohol.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.log.LogAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mid.alcohol.dto.payment.AdressUpdateDto;
import com.mid.alcohol.dto.payment.BasketListDto;
import com.mid.alcohol.dto.payment.BasketUpdateListDto;
import com.mid.alcohol.dto.payment.OrderProductDto;
import com.mid.alcohol.dto.payment.PaymentAdressModifyDto;
import com.mid.alcohol.dto.payment.PaymentListDto;
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
	public String paymentInfo(Model model, @RequestParam(name = "quantity") List<Integer> quantitylist,
			@RequestParam(name = "basketid") List<Integer> basketidlist,
			@RequestParam(name = "productid") List<Integer> productidlist,
			@RequestParam(name = "price") List<Integer> pricelist) {
		log.info("paymentInfoPost()");
		log.info("quantitylist: {}", quantitylist);
		log.info("basketidlist: {}", basketidlist);
		log.info("productidlist: {}", productidlist);
		log.info("pricelist: {}", pricelist);
		// 받아온 값으로 basket 업데이트할 값 만들어주기
		List<BasketUpdateListDto> basketUpdateListDto = new ArrayList<>();
		for (int i = 0; i < quantitylist.size(); i++) {
			BasketUpdateListDto basketUpdateDto = new BasketUpdateListDto();
			basketUpdateDto.setQuantity(quantitylist.get(i));
			basketUpdateDto.setBasketid(basketidlist.get(i));
			basketUpdateListDto.add(basketUpdateDto);
		}
		// 장바구니 업데이트
		paymentService.updateBaket(basketUpdateListDto);

		String userNickname = (String) session.getAttribute("userNickname");
		// 결제 테이블 생성
		paymentService.insertPayment(userNickname);
		// 결제 id가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제목록 만들기
		List<PaymentListDto> list = new ArrayList<>();
		// PaymentlistDto 객체 만들어서 리스트에 넣어주기
		for (int i = 0; i < quantitylist.size(); i++) {
			PaymentListDto paymentListDto = new PaymentListDto(paymentid, productidlist.get(i), quantitylist.get(i),
					pricelist.get(i), userNickname, basketidlist.get(i));
			list.add(paymentListDto);
		}
		// 결제목록리스트 넣어주기
		paymentService.insertPaymentList(list);

		return "redirect:/payment/paymentmain";
	}

	@PostMapping("/updateDeliveryInfo")
	public String updateDeliveryInfo(AdressUpdateDto dto) {
		log.info("updateDeliveryInfo(dto={})", dto);

		int result = paymentService.update(dto);
		log.info("updateDeliveryInfo = {}", dto);
		return "redirect:/payment/paymentmain";

		/*
		 * String userNickname = (String)session.getAttribute("userNickname");
		 * paymentService.insertPayment(userNickname); int paymentid =
		 * paymentService.readPaymentList(userNickname); log.info(userNickname);
		 * 
		 * ObjectMapper objectMapper = new ObjectMapper(); List<OrderProductDto>
		 * orderProductDtoList = null; try { orderProductDtoList =
		 * objectMapper.readValue(orderProductDtoJson, new
		 * TypeReference<List<OrderProductDto>>() {}); } catch (JsonMappingException e)
		 * { e.printStackTrace(); } catch (JsonProcessingException e) {
		 * e.printStackTrace(); } for (OrderProductDto x : orderProductDtoList) {
		 * log.info(""+x); }
		 * 
		 * for (OrderProductDto opdto : orderProductDtoList) {
		 * opdto.setUserNickname(userNickname); opdto.setPaymentid(paymentid);
		 * 
		 * } paymentService.insertOrder(orderProductDtoList); PaymentAdressModifyDto dto
		 * = paymentService.read(userNickname); model.addAttribute("userinfo", dto);
		 */

	}

	@GetMapping("/paymentmain")
	public void paymentInfoGet(Model model) {
		log.info("paymentInfoGet()");
		String userNickname = (String) session.getAttribute("userNickname");
		log.info(userNickname);
		PaymentAdressModifyDto dto = paymentService.read(userNickname);
		model.addAttribute("userinfo", dto);

		// 결제 id 가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제 id로 basketid 가져오기
		List<Integer> basketidlist = paymentService.getBasketidFromOrders(paymentid);
		// 장바구니 리스트 가져오기
		List<BasketListDto> list = paymentService.getBasketList(basketidlist);
		// 모델에 list 넣기
		model.addAttribute("list", list);

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
	public String kakaopay() throws UnsupportedEncodingException {
		String userNickname = (String) session.getAttribute("userNickname");
		// 결제 id 가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제 id로 basketid 가져오기
		List<Integer> basketidlist = paymentService.getBasketidFromOrders(paymentid);
		//
		String pname = paymentService.getPname(basketidlist.get(0));

		// 결제목록 가져오기
		List<PaymentListDto> list = paymentService.getPaymentList(paymentid);
		int paymentCount = (basketidlist.size() - 1);
		String item_name = pname + " 외 " + paymentCount + "건";
		item_name = URLEncoder.encode(item_name, "utf-8");
		int totalAmount = 0;
		for (PaymentListDto x : list) {
			totalAmount += x.getPrice() * x.getQuantity();
		}
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			try {
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK 57e7976b8b01733b8d39b2e982361037");
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true);
				// String nickname = URLEncoder.encode(userNickname, "utf-8");
				String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="
						+ item_name + "&quantity=1&total_amount=" + totalAmount
						+ "&tax_free_amount=0&approval_url=http://localhost:8081/alcohol/payment/paysuccess&fail_url=http://localhost:8081/alcohol/payment/payfail&cancel_url=http://localhost:8081/alcohol/payment/paycancel";
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
				log.info("코드" + result);
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
	public void paysuccess(Model model) {
		String userNickname = (String) session.getAttribute("userNickname");
		// 결제 id 가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제 id로 basketid 가져오기
		List<Integer> basketidlist = paymentService.getBasketidFromOrders(paymentid);
		// 결제한 내역 보여주기
		// 장바구니 리스트 가져오기
		List<BasketListDto> list = paymentService.getBasketList(basketidlist);
		// 모델에 list 넣기
		model.addAttribute("list", list);
		// basketid로 basket 테이블 지우기
		paymentService.deletebasket(basketidlist);
	}

	@GetMapping("/paycancel")
	public void paycancel() {
		String userNickname = (String) session.getAttribute("userNickname");
		// 결제 id 가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제 id로 주문목록 지우기
		paymentService.deleteOrders(paymentid);
		// 결제 id로 결제 테이블 지우기
		paymentService.deletePayment(paymentid);
	}

	@GetMapping("/payfail")
	public void payfail() {
		String userNickname = (String) session.getAttribute("userNickname");
		// 결제 id 가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제 id로 주문목록 지우기
		paymentService.deleteOrders(paymentid);
		// 결제 id로 결제 테이블 지우기
		paymentService.deletePayment(paymentid);
	}

	@PostMapping("/paymentcancel")
	public void paymentcancel() {
		String userNickname = (String) session.getAttribute("userNickname");
		// 결제 id 가져오기
		int paymentid = paymentService.readPaymentList(userNickname);
		// 결제 id로 주문목록 지우기
		paymentService.deleteOrders(paymentid);
		// 결제 id로 결제 테이블 지우기
		paymentService.deletePayment(paymentid);

	}

}

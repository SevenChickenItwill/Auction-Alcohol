package com.mid.alcohol.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.payment.AdressUpdateDto;
import com.mid.alcohol.dto.payment.BasketListDto;
import com.mid.alcohol.dto.payment.BasketUpdateListDto;
import com.mid.alcohol.dto.payment.OrderProductDto;
import com.mid.alcohol.dto.payment.PaymentAdressModifyDto;
import com.mid.alcohol.repository.PaymentRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentService {
	
	@Autowired
	private PaymentRepository paymentRepository;
	

	// 배송지 업데이트
	public int update(AdressUpdateDto user) {
		log.info("update({})", user);
		
		return paymentRepository.updateDeliveryInfo(user.toEntity());
	}

	
	// 결제창에서 회원가입시 DB에 저장되어 있는 기존 회원 정보 불러오기
	public PaymentAdressModifyDto read(String userNickname) {

		log.info("read(userNickName={})", userNickname);

		
		User entity = paymentRepository.selectByOrderInfo(userNickname);
		log.info("하이");
		PaymentAdressModifyDto dto = PaymentAdressModifyDto.fromEntity(entity);
		log.info("run");
		return dto;
	}

	public List<BasketListDto> readBasketByUserNickname(String userNickname) {
		log.info("readBasketByuserNickname(userNickname={})", userNickname);
		return paymentRepository.readBasketByUserNickname(userNickname);

	}

	public void insertPayment(String userNickname) {
		paymentRepository.insertPayment(userNickname);
	}

	public int readPaymentList(String userNickname) {
		return paymentRepository.readPaymentList(userNickname);
	}

	public void insertOrder(List<OrderProductDto> list) {
		paymentRepository.insertOrder(list);
	}


	public void updateBaket(List<BasketUpdateListDto> basketUpdateListDto) {
		for (BasketUpdateListDto dto : basketUpdateListDto) {
			paymentRepository.updateBaket(dto);
		}
	}


	public void deletebasket(int basketid) {
		paymentRepository.deletebasket(basketid);
	}
}

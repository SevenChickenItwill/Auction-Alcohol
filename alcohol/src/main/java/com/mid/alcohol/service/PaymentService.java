package com.mid.alcohol.service;


import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Payment;
import com.mid.alcohol.dto.AdressUpdateDto;
import com.mid.alcohol.dto.PaymentDetailDto;
import com.mid.alcohol.repository.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PaymentService {
	
	private final PaymentRepository paymentRepository;
	
	// 배송지 업데이트
	public int update(AdressUpdateDto payment) {
		log.info("update({})", payment);
		
		return paymentRepository.updateDeliveryInfo(payment.toEntity());
	}
	
	// 구매 상세 정보
	public PaymentDetailDto read(String order_name) {
		log.info("read(order_name={})", order_name);
		
		Payment entity = paymentRepository.selectByOrder_name(order_name);
		
		PaymentDetailDto dto = PaymentDetailDto.fromEntity(entity);
		
		return dto;
	}
}

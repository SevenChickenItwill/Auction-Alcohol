package com.mid.alcohol.service;


import org.springframework.stereotype.Service;

import com.mid.alcohol.dto.AdressUpdateDto;
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
}

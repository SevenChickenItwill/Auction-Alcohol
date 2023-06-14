package com.mid.alcohol.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.AdressUpdateDto;


import com.mid.alcohol.dto.BasketListDto;
import com.mid.alcohol.dto.PaymentAdressModifyDto;
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
		log.info("read(userNickname={})", userNickname);
		
		User entity = paymentRepository.selectByOrderInfo(userNickname);
		log.info("하이");
		PaymentAdressModifyDto dto = PaymentAdressModifyDto.fromEntity(entity);
		log.info("run");
		return dto;
	}

	public List<BasketListDto> readBasketByUserid(String userid) {
		log.info("readBasketByUserid(userid={})", userid);
		return paymentRepository.readBasketByUserid(userid);

	}
}

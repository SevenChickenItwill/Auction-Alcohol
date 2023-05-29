package com.mid.alcohol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Payment;
import com.mid.alcohol.dto.PaymentDto;
import com.mid.alcohol.repository.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PaymentService {

	 private final PaymentRepository paymentRepository;


	    public PaymentDto selectById(long id) {
	        log.info("selectById(id={})", id);
	        
	        return paymentRepository.selectById(id);
	    }

	    public int readByIdUpdate(Payment payment) {
	        log.info("readByIdUpdate()");
	        
	        return paymentRepository.updatePaymentById(payment);
	    }

	    public int paymentDelete(long id) {
	        log.info("dealDelete(id= {})", id);
	        
	        return paymentRepository.deletePaymentById(id);
	    }

	    public int create(PaymentDto dto) {
	        log.info("creat(dto= {})", dto);
	        
	        
	        return paymentRepository.dealInsert(dto);
	    }

}

package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Payment;

public interface PaymentRepository {
	
	List<Payment> selectOrderByIdesc();
	
	Payment selectById(String userId);
	Payment selectByMemberId(int mamberId);
	
}

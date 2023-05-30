package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Payment;
import com.mid.alcohol.dto.PaymentDto;

public interface PaymentRepository {
	
	int insert(Payment payment);
	
	List<Payment> selectOrderByIdesc();
	List<Payment> selectAllOrderByIdDesc();
	
	Payment selectById(String userId);
	Payment selectByMemberId(int memberId);
	 
    int paymentInsert(PaymentDto payment);
    
    PaymentDto selectById(long id);
    
    int updatePaymentById(Payment payment);
    
    int deletePaymentById(long id);
}

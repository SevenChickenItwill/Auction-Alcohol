package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.Payment;

@Repository
public interface PaymentRepository {

    int updateDeliveryInfo(Payment payment);
    
    Payment selectByOrderInfo(String order_name);
    

}

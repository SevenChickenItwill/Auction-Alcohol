package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Payment;
import com.mid.alcohol.dto.BasketListDto;
import com.mid.alcohol.dto.PaymentDto;

public interface PaymentRepository {

    int updateDeliveryInfo(Payment payment);
    
    List<BasketListDto> readBasketByUserid(String userid);

}

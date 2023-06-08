package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.Payment;

import com.mid.alcohol.dto.BasketListDto;
import com.mid.alcohol.dto.PaymentDto;


@Repository
public interface PaymentRepository {

    int updateDeliveryInfo(Payment payment);
    

    Payment selectByOrderInfo(String order_name);
    

    List<BasketListDto> readBasketByUserid(String userid);


}

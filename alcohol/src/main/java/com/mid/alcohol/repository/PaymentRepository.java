package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.Payment;
import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.BasketListDto;


@Repository
public interface PaymentRepository {

    int updateDeliveryInfo(Payment payment);
    

    User selectByOrderInfo(String userNickName);
    

    List<BasketListDto> readBasketByUserid(String userid);


}

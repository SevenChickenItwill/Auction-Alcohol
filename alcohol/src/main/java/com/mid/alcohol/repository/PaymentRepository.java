package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.BasketListDto;


@Repository
public interface PaymentRepository {

    

    User selectByOrderInfo(String userNickName);
    

    List<BasketListDto> readBasketByUserid(String userid);


}

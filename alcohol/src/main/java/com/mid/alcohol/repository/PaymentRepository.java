package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.PaymentList;
import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.BasketListDto;
import com.mid.alcohol.dto.OrderProductDto;


@Repository
public interface PaymentRepository {

    

    User selectByOrderInfo(String userNickName);
    

    List<BasketListDto> readBasketByUserid(String userid);


	void insertPayment(String userNickname);


	int readPaymentList(String userNickname);


	void insertOrder(List<OrderProductDto> list);


}

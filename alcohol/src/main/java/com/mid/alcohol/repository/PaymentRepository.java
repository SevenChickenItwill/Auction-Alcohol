package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.payment.BasketListDto;
import com.mid.alcohol.dto.payment.OrderProductDto;


@Repository
public interface PaymentRepository {

    int updateDeliveryInfo(User user);
    
    User selectByOrderInfo(String userNickname);
    
    List<BasketListDto> readBasketByUserid(String userid);

	void insertPayment(String userNickname);

	int readPaymentList(String userNickname);

	void insertOrder(List<OrderProductDto> list);


}

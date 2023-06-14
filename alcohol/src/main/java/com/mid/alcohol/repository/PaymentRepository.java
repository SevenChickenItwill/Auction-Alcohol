package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import com.mid.alcohol.domain.Payment;
=======
import com.mid.alcohol.domain.PaymentList;
>>>>>>> Dahan12
import com.mid.alcohol.domain.User;
import com.mid.alcohol.dto.BasketListDto;
import com.mid.alcohol.dto.OrderProductDto;


@Repository
public interface PaymentRepository {

<<<<<<< HEAD
    int updateDeliveryInfo(User user);
    
=======
    

    User selectByOrderInfo(String userNickName);
>>>>>>> Dahan12
    
    User selectByOrderInfo(String userNickname);
    
        
    List<BasketListDto> readBasketByUserid(String userid);


	void insertPayment(String userNickname);


	int readPaymentList(String userNickname);


	void insertOrder(List<OrderProductDto> list);


}

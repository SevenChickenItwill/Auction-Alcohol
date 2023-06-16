package com.mid.alcohol.repository;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.user.User;
import com.mid.alcohol.dto.payment.BasketListDto;
import com.mid.alcohol.dto.payment.BasketUpdateListDto;
import com.mid.alcohol.dto.payment.OrderProductDto;
import com.mid.alcohol.dto.payment.PaymentListDto;


@Repository
public interface PaymentRepository {

    int updateDeliveryInfo(User user);
    
    User selectByOrderInfo(String userNickname);
    
    List<BasketListDto> readBasketByUserNickname(String userNickname);

	void insertPayment(String userNickname);

	int readPaymentList(String userNickname);

	void insertOrder(List<OrderProductDto> list);

	void updateBaket(BasketUpdateListDto basketUpdateListDto);

	void deletebasket(int basketid);

	void insertPaymentList(PaymentListDto x);

	void deleteOrders(int paymentid);

	void deletePayment(int paymentid);

	List<PaymentListDto> getPaymentList(int paymentid);

	List<Integer> getBasketidFromOrders(int paymentid);

	String getPname(Integer basketid);



}

package com.mid.alcohol.dto.payment;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PaymentListDto {

	private int paymentid;
	private int productid;
	private int quantity;
	private int price;
	private String userNickname;
	private int basketid;
}

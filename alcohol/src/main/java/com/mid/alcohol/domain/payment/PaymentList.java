package com.mid.alcohol.domain.payment;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PaymentList {
	
	private int paymentid;
	private String userNickname;
	
	
	
}

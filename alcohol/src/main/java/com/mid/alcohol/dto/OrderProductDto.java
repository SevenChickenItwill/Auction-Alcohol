package com.mid.alcohol.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderProductDto {

	private String userNickname;
	private int quantity;
	private int basketid;
	private int productid;
	private long totalAmount;
	private long price;
	private int paymentid;
	
}

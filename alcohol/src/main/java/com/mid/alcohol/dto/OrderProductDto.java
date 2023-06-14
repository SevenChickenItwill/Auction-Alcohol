package com.mid.alcohol.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderProductDto {

	private String userNickname;
	private int quantity;
	private int basketid;
	private int productid;
	private long totalAmount;
	private long price;
	private int paymentid;
	
}

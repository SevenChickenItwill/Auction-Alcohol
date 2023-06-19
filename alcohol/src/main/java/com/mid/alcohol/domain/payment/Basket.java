package com.mid.alcohol.domain.payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Basket {
	
	private int basketid;
	private int productid;
	private String userid;
	private long price;
	private int quantity;
	private String productname;
	
}

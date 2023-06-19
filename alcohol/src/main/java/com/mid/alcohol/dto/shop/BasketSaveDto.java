package com.mid.alcohol.dto.shop;

import com.mid.alcohol.domain.payment.Basket;


import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
public class BasketSaveDto {

	private int productid;
	private int quantity;
	private long price;
	private int basketid;
	private String productname;

	public Basket toEntity() {

		return Basket.builder()
				.productid(productid)
				.quantity(quantity)
				.price(price)
				.basketid(basketid)
				.productname(productname)
				.build();
				
				
				
				

	}
}

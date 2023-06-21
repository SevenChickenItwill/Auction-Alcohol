package com.mid.alcohol.dto.payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class BasketListDto {

	private int basketid;
	private int productid;
	private long price;
	private int quantity;
	private String brand; // 브랜드명
	private String productname; // 상품명
}

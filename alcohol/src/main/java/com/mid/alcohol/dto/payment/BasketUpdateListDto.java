package com.mid.alcohol.dto.payment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketUpdateListDto {
	private int quantity;
	private int basketid;
}

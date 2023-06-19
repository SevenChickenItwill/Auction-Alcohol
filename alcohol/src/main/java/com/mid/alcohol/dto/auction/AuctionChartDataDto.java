package com.mid.alcohol.dto.auction;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuctionChartDataDto {
	
	private long total;
	private long month;
	
	
}

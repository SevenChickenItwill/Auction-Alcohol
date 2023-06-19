package com.mid.alcohol.dto.auction;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Slf4j
public class AuctionChartDto {

	private String userid;
	private Timestamp date;
	
	public void toEntity() {
		
		
		LocalDateTime loc = date.toLocalDateTime();
		
		LocalDateTime datestart = loc.minusMonths(3);
		datestart = LocalDateTime.of(datestart.getYear(), datestart.getMonthValue(), 1, 0, 0);
		date = Timestamp.valueOf(datestart);
		log.info("{}",date.getMonth(),date.getDay());
	}
	
}

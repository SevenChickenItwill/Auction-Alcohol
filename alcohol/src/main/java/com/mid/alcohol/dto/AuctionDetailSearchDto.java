package com.mid.alcohol.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuctionDetailSearchDto {

	private String userid;
	private String searchtext2;
	private Timestamp auctionstart;
	private Timestamp auctionend;
	private int category;
	private int status;
	private int textoption;
	private long minimum;
	private long maximum;
	
	public void formChange() {
		
		if(searchtext2==null) {
			searchtext2="";
		}
		
		// 종료일보다 시작일이 늦으면 종료일을 시작일로 변경
		if(auctionend.compareTo(auctionstart)<0) {
			auctionend=auctionstart;
		}
		
		searchtext2="%"+searchtext2+"%";
		
		
		
	}
	
}

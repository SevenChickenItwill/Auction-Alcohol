package com.mid.alcohol.domain.auction;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Chat {
	
	private long contentid;
	private long cid;
	private String userid;
	private String conversation;
	private int texttype;
	private LocalDateTime createdtime;
	
}

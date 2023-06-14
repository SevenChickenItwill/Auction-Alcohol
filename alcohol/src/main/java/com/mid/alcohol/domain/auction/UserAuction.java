package com.mid.alcohol.domain.auction;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserAuction {

	private long cid;
	private String chatroom;
	private int membercount;
	
	
}

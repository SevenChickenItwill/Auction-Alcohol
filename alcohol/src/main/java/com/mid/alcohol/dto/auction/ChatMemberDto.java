package com.mid.alcohol.dto.auction;

import com.mid.alcohol.domain.auction.Chat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatMemberDto {

	private long cid;
	private String userid;
	
	
	
}

package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Chat;

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

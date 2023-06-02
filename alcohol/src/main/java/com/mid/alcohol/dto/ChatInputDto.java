package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Chat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ChatInputDto {
	
	private long cid;
	private String userid;
	private String conversation;
	
	
	public Chat toEntity() {
		
		return Chat.builder().cid(cid).userid(userid).conversation(conversation).texttype(0).build();
		
	}
	
}

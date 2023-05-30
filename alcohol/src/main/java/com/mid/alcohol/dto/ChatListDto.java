package com.mid.alcohol.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatListDto {

	private long cid;
	private long aid;
	private String userid;
	private String conversation;
	private int texttype;
	private int quickroot;
	private String chatroom;
	private int membercount;
	private long conetentid;
	
}

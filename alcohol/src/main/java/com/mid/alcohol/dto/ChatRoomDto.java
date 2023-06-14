package com.mid.alcohol.dto;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import com.mid.alcohol.service.AuctionUserService;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomDto {

	private long cid;
	private String chatroom;
	
	//WebSocketSession 은 Spring에서 WebSocket Connection 이 맺어진 세션.
	
	public static ChatRoomDto make(String chatroom, long cid) {
		
		
		
		ChatRoomDto chats = ChatRoomDto.builder().chatroom(chatroom).cid(cid).build();
		return chats;
	}
	
    

    

	
}

package com.mid.alcohol.dto;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

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
	private Set<WebSocketSession> sessions = new HashSet<>();
	//WebSocketSession 은 Spring에서 WebSocket Connection 이 맺어진 세션.
	
	public static ChatRoomDto make(AuctionListDto dto) {
		
		ChatRoomDto chatroom = ChatRoomDto.builder().chatroom(dto.getAuctionName()).cid(dto.getAid()).build();
		return chatroom;
	}
	
}

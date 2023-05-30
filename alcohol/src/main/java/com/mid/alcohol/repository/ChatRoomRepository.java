package com.mid.alcohol.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.dto.ChatRoomDto;

import jakarta.annotation.PostConstruct;

@Repository
public class ChatRoomRepository {

	@Autowired
	private AuctionRepository auctionRepository;
	
	private Map<Long, ChatRoomDto> chatRoomDtoMap;
	
	@PostConstruct
	private void init() {
		
		chatRoomDtoMap = new LinkedHashMap<>();
		
	}
	
	public List<ChatRoomDto> findAllRooms(){
		
		List<ChatRoomDto> list = new ArrayList<>(chatRoomDtoMap.values());
		Collections.reverse(list);
		
		return list;
	}
	
	public ChatRoomDto findRoomById(long cid) {
		
		return chatRoomDtoMap.get(cid);
		
	}
	
	public ChatRoomDto createChatRoomDto(AuctionListDto dto) {
		ChatRoomDto room = ChatRoomDto.make(dto);
		chatRoomDtoMap.put(room.getCid(), room);
		return room;
	}
}

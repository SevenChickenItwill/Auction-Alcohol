package com.mid.alcohol.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mid.alcohol.domain.Chat;
import com.mid.alcohol.domain.UserAuction;
import com.mid.alcohol.dto.ChatInputDto;
import com.mid.alcohol.dto.ChatListDto;
import com.mid.alcohol.dto.ChatRoomDto;
import com.mid.alcohol.repository.AuctionRepository;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class AuctionUserService {
	// 사실상 채팅방 관리 클래스(ChatRoomManager)
	@Autowired
	private AuctionRepository auctionrepository;

	@Autowired
	private AuctionService aucservice;

	// 채팅방 목록 불러오기
	public List<UserAuction> readAllRoom() {
		log.info("readAllRoom()");

		return auctionrepository.selectAllRoom();

	}

	

	

	// 채팅 실행하기
	public int createChatContent(ChatInputDto dto) {

		log.info("createChatContent{})", dto);
		int result = auctionrepository.createChatContents(dto.toEntity());
		log.info("result = {}", result);
		return result;

	}

	// 채팅방 삭제하기 ( 채팅 내용 삭제가 종속되어 있기 때문에 같이 실행 )
	public int deleteChatRoom(long cid) {
		log.info("deleteChatRoom(cid={})", cid);

		
		
		int result = auctionrepository.deleteChatRoom(cid);
		log.info("{} 개 방 삭제", result);

		return result;

	}

	// 채팅 내용 삭제.
	public int deleteChatContent(long cid) {
		log.info("deleteChatContent({})", cid);

		int result = auctionrepository.deleteChatContents(cid);
		return result;
	}





	public List<ChatListDto> readChatDataOne(int aid) {
		// 구현 기능
		log.info("readChatDataOne({})",aid);
		
		return auctionrepository.selectByChatContents(aid);
	}
	

	
	

}

package com.mid.alcohol.repository;

import java.util.List;


import com.mid.alcohol.domain.Auction;
import com.mid.alcohol.domain.AuctionProducts;
import com.mid.alcohol.domain.Chat;
import com.mid.alcohol.domain.UserAuction;
import com.mid.alcohol.dto.AuctionListDto;
import com.mid.alcohol.dto.ChatListDto;
import com.mid.alcohol.dto.ChatMemberDto;

public interface AuctionRepository {
    
	// 경매 관리 관련 SQL
    List<AuctionProducts> selectByPName(AuctionProducts product);
    
    AuctionProducts selectByPNameOne(AuctionProducts product);

	int writeAuction(Auction entity);

	List<AuctionListDto> readAuctionList(String userid);
	
	AuctionListDto selectModifyOne(int aid);

	int update(Auction auction);

	int delete(int aid);
	
	// 경매 활동 관련 SQL
	
	// 채팅방 목록
	List<UserAuction> selectAllRoom();
	
	// 채팅 관련 데이터(참여자, 내용 등)
	List<ChatListDto> selectByChatContents(long cid);
	
	// 채팅방 신규 등록
	int createChatRoom(UserAuction chatroom);
	
	// 채팅 내용 등록
	int createChatContents(Chat chat);
	
	// 채팅 내용 삭제
	int deleteChatContents(long cid);
	
	// 채팅방 삭제
	int deleteChatRoom(long cid);
	
	// 채팅방 참여자 불러오기
	List<ChatMemberDto> readChatMember();
	
	// 경매 목록 불러오기
	List<AuctionListDto> readAllAuctionList();
}


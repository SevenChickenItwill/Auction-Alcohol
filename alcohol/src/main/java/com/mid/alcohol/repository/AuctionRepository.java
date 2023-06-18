package com.mid.alcohol.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.auction.Auction;
import com.mid.alcohol.domain.auction.AuctionProducts;
import com.mid.alcohol.domain.auction.Chat;
import com.mid.alcohol.domain.auction.Photo;
import com.mid.alcohol.domain.auction.UserAuction;
import com.mid.alcohol.dto.auction.AuctionDetailSearchDto;
import com.mid.alcohol.dto.auction.AuctionListDto;
import com.mid.alcohol.dto.auction.AuctionSearchDto;
import com.mid.alcohol.dto.auction.ChatListDto;
import com.mid.alcohol.dto.auction.ChatMemberDto;


@Repository
public interface AuctionRepository {
    
	// 경매 관리 관련 SQL
    List<AuctionProducts> selectByPName(AuctionProducts product);
    
    AuctionProducts selectByPNameOne(AuctionProducts product);

	int writeAuction(Auction entity);

	List<AuctionListDto> readAuctionList(String userid);
	
	List<AuctionListDto> searchText(AuctionSearchDto dto);
	
	AuctionListDto selectModifyOne(int aid);

	int update(Auction auction);

	int delete(long aid);
	
	

	List<AuctionListDto> detailreadfirst1(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadsecond1(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadthird1(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadfourth1(AuctionDetailSearchDto dto);
	
	List<AuctionListDto> detailreadfirst2(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadsecond2(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadthird2(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadfourth2(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadfirst3(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadsecond3(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadthird3(AuctionDetailSearchDto dto);

	List<AuctionListDto> detailreadfourth3(AuctionDetailSearchDto dto);
	
	
	
	
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
	
	// 진행중 경매 목록 불러오기
	List<AuctionListDto> readIngAuctionList();
	
	// 종료된 경매 목록 불러오기
	List<AuctionListDto> readEndAuctionList();

	List<ChatListDto> readchatDataOne(int aid);

	int updatebat(Auction auctionEntity);

	void updateStatus(Timestamp now);

	void updateStart(Timestamp now);

	List<Chat> readAllchatData(String userNickname);

	Photo findphotoroot(int pid);

}


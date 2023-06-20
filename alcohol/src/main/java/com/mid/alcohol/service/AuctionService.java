package com.mid.alcohol.service;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.auction.Auction;
import com.mid.alcohol.domain.auction.AuctionProducts;
import com.mid.alcohol.domain.auction.Chat;
import com.mid.alcohol.domain.auction.Photo;
import com.mid.alcohol.domain.auction.UserAuction;
import com.mid.alcohol.dto.auction.AuctionChartDataDto;
import com.mid.alcohol.dto.auction.AuctionChartDto;
import com.mid.alcohol.dto.auction.AuctionDetailSearchDto;
import com.mid.alcohol.dto.auction.AuctionListDto;
import com.mid.alcohol.dto.auction.AuctionOpenDto;
import com.mid.alcohol.dto.auction.AuctionReadDto;
import com.mid.alcohol.dto.auction.AuctionSearchDto;
import com.mid.alcohol.dto.auction.ChatInputDto;
import com.mid.alcohol.dto.auction.ChatListDto;
import com.mid.alcohol.dto.auction.ChatRoomDto;
import com.mid.alcohol.dto.auction.ProductSearchDto;
import com.mid.alcohol.dto.shop.ShopPaymentListDto;
import com.mid.alcohol.repository.AuctionProductRepository;
import com.mid.alcohol.repository.AuctionRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AuctionService {

	@Autowired
	private AuctionProductRepository acprepository;

	@Autowired
	private AuctionRepository auctionrepository;

	
	
	public List<AuctionListDto> searchAuction(AuctionSearchDto dto) {
		dto.toSearch();
		log.info("{}", dto.getSearchtext());
		return auctionrepository.searchText(dto);
	}

	public List<AuctionProducts> search(ProductSearchDto dto) {

//		if(dto.getPname().length()==0) {
//			
//			return new ArrayList<AuctionProducts>();
//			
//		}

		log.info("serach(dto={})");

		AuctionProducts product = dto.toEntity(0);

		return auctionrepository.selectByPName(product);

	}

	public AuctionReadDto read(ProductSearchDto dto) {
		log.info("read({})", dto);

		AuctionProducts p = auctionrepository.selectByPNameOne(dto.toEntity(1));

		if (p == null) {

			return new AuctionReadDto();

		}

		AuctionReadDto ardto = AuctionReadDto.FromEntity(p);

		return ardto;

	}

	public int write(AuctionOpenDto dto) {
		// TODO Auto-generated method stub
		log.info("write({})", dto);

		LocalDateTime start = dto.getAuctionStart();
		LocalDateTime endtime = dto.getAuctionEnd();
		LocalDateTime now = LocalDateTime.now();
		int diff = start.compareTo(endtime);
		int diffnow1 = start.compareTo(now);
		int diffnow2 = endtime.compareTo(now);
		Duration duration = Duration.between(start, endtime);
		long hoursDifference = duration.toHours();

		if (diff < 0 && hoursDifference >= 24 && diffnow1 > 0 && diffnow2 > 0) {

			return auctionrepository.writeAuction(dto.toEntity());

		} else {
			log.info("등록 실패");
			return 0;

		}
		
		
	}

	public List<AuctionListDto> readlist(String userid) {
		// TODO Auto-generated method stub
		log.info("readlist()");

		return auctionrepository.readAuctionList(userid);
	}

	public AuctionListDto readOne(int aid) {
		log.info("readOne()");

		return auctionrepository.selectModifyOne(aid);

	}

	public int update(AuctionOpenDto dto, int aid) {
		log.info("update(dto= {},aid= {})", dto, aid);

		Auction auction = dto.toEntity();
		auction.setAid(aid);
		if(dto.getStatus()==1) {
			ChatRoomDto dto2= ChatRoomDto.make(dto.getAuctionName(),aid);
			UserAuction chatroom = UserAuction.builder().chatroom(dto2.getChatroom()).cid(aid).build();
			auctionrepository.createChatRoom(chatroom);
			log.info("{} room is created",aid);
		}
		return auctionrepository.update(auction);
	}

	public int delete(long aid) {
		
		log.info("delete({})", aid);
		
		
		return auctionrepository.delete(aid);
	}

	public List<AuctionListDto> searchDetail(AuctionDetailSearchDto dto) {
		// 경매 상세 검색
		
		dto.formChange(); // 무결성 통과를 위한 값 변환 진행

		return selectByOption(dto);
	}

	public List<AuctionListDto> selectByOption(AuctionDetailSearchDto dto) {
		List<AuctionListDto> list = new ArrayList<>();

		int textoption = dto.getTextoption();
		int status = dto.getStatus();
		int category = dto.getCategory();

		switch (textoption) {
		case 1:
			if (status == 3 && category != 0) {

				list = auctionrepository.detailreadfirst1(dto);

			} else if (status != 3 && category == 0) {

				list = auctionrepository.detailreadsecond1(dto);

			} else if (status == 3 && category == 0) {

				list = auctionrepository.detailreadthird1(dto);

			} else {

				list = auctionrepository.detailreadfourth1(dto);

			}
			break;

		case 2:
			if (status == 3 && category != 0) {

				list = auctionrepository.detailreadfirst2(dto);

			} else if (status != 3 && category == 0) {

				list = auctionrepository.detailreadsecond2(dto);

			} else if (status == 3 && category == 0) {

				list = auctionrepository.detailreadthird2(dto);

			} else {

				list = auctionrepository.detailreadfourth2(dto);

			}

			break;
		case 3:
			if (status == 3 && category != 0) {

				list = auctionrepository.detailreadfirst3(dto);

			} else if (status != 3 && category == 0) {

				list = auctionrepository.detailreadsecond3(dto);

			} else if (status == 3 && category == 0) {

				list = auctionrepository.detailreadthird3(dto);

			} else {

				list = auctionrepository.detailreadfourth3(dto);

			}
			break;
		}

		return list;
	}

	// 경매 운영 관련
	
	// 경매 모든 목록 불러오기
	public List<AuctionListDto> readAlllist() {
		// TODO Auto-generated method stub
		log.info("readlist()");

		return auctionrepository.readAllAuctionList();
	}
	
	// 경매 모든 목록 불러오기
	public List<AuctionListDto> readInglist() {
		// TODO Auto-generated method stub
		log.info("readlist()");

		return auctionrepository.readIngAuctionList();
	}
		
		// 경매 모든 목록 불러오기
	public List<AuctionListDto> readEndlist() {
		// TODO Auto-generated method stub
		log.info("readlist()");
		
		List<AuctionListDto> list = auctionrepository.readEndAuctionList();
		
		return list;
	}

	public int updatebat(ChatInputDto dto) {
		// TODO Auto-generated method stub
		log.info("dto={}",dto);
		Auction entity = dto.toAuctionEntity();
		log.info("{}",entity);
		return auctionrepository.updatebat(entity);
	}

	public List<AuctionListDto> readUserEnd(String attribute) {
		// TODO Auto-generated method stub
		List<AuctionListDto> list = auctionrepository.readEndAuctionList();
		
		List<AuctionListDto> list2 = new ArrayList<>();
		
		for(AuctionListDto x : list) {
			
			if(attribute.equals(x.getBidder())) {
				list2.add(x);
				log.info("{}",x);
			}
			
		}
		
		
		return list2;
	}

	public List<AuctionListDto> readUserIng(String attribute) {
		// TODO Auto-generated method stub
		List<Chat> list = auctionrepository.readAllchatData(attribute);
		HashSet<Long> set = new HashSet<>();
		for(Chat x : list) {
			
			set.add(x.getCid());
			
		}
		
		List<AuctionListDto> list2 = auctionrepository.readAllAuctionList();
		List<AuctionListDto> list3 = new ArrayList<>();
		for(AuctionListDto x : list2) {
			
			for(Long y : set) {
				
				if(x.getAid()==y) {
					list3.add(x);
				}
				
			}
			
			
		}
		log.info("{}",list3);
		return list3;
	}

	public Photo findphotoroot(int productId) {
		// TODO Auto-generated method stub
		return auctionrepository.findphotoroot(productId);
	}

	public List<AuctionChartDataDto> readSalesData(AuctionChartDto dto) {
		// TODO Auto-generated method stub
		log.info("readSalesData({})",dto);
		
		 List<AuctionChartDataDto> list = auctionrepository.readSalesData(dto);
		 
		
		 
		 
		 
		 return list;
	}

	public List<AuctionChartDataDto> readAuctionData(AuctionChartDto dto) {
		// TODO Auto-generated method stub
		dto.toEntity();
		
		return auctionrepository.readAuctionData(dto);
	}

	

	

	// 스케줄링 관련 메서드
	
	
	
	
	// 채팅방-유저 매핑

}

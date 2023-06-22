package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.board.Bulletinboard;
import com.mid.alcohol.domain.board.RecommendDown;
import com.mid.alcohol.domain.board.RecommendUp;
import com.mid.alcohol.dto.board.BulletinboardCreateDto;
import com.mid.alcohol.dto.board.BulletinboardDetailDto;
import com.mid.alcohol.dto.board.BulletinboardImageUpdateDto;
import com.mid.alcohol.dto.board.BulletinboardKeywordDto;
import com.mid.alcohol.dto.board.BulletinboardListDto;
import com.mid.alcohol.dto.board.BulletinboardUpdateDto;

// bulletinboard-mapper
public interface BulletinboardRepository {
    
    int bulletinboardInsert(BulletinboardCreateDto dto);
    
    List<BulletinboardListDto> selectOrderByIdDesc();
    
    BulletinboardDetailDto selectById(long board_id);
    
    int bulletinboardDeleteById(long board_id);
    
    int bulletinboardUpdateById(BulletinboardUpdateDto dto);
    
    List<BulletinboardListDto> selectWhereTitle(String keyword);
    
    List<BulletinboardListDto> selectWhereContent(String keyword);
    
    List<BulletinboardListDto> selectWhereTitleAndContent(BulletinboardKeywordDto dto);
    
    List<BulletinboardListDto> selectWhereNickname(String keyword);
    
    List<BulletinboardListDto> selectWhereUserId(String keyword);

	int recommendUp(long boardId);

	int recommendDo(long boardId);
	
	int recommendupInsert(RecommendUp recommend);
	
	int recommenddownInsert(RecommendDown recommend);
	
	RecommendUp recommendUpSelect(RecommendUp recommend);
	
	RecommendDown recommendDownSelect(RecommendDown recommend);
	
	int viewsUp(long boardId);

	List<BulletinboardListDto> selectAnnouncement();
	
	List<BulletinboardListDto> selectOrderByRecommend();

	List<Bulletinboard> readHistoryByNickname(String nickname);
	
	List<Bulletinboard> selectNicknameOrderByboardId(String nickname);
	
	int imageUpdate(BulletinboardImageUpdateDto dto);
	
	int recommendUpDelete(long boardId);

	int recommendDownDelete(long boardId);
	
}

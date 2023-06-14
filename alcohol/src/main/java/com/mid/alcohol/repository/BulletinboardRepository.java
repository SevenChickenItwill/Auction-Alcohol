package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.domain.RecommendDown;
import com.mid.alcohol.domain.RecommendUp;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardImageUpdateDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.dto.BulletinboardUpdateDto;

// bulletinboard-mapper
public interface BulletinboardRepository {
    
    int bulletinboardInsert(BulletinboardCreateDto dto);
    
    List<BulletinboardListDto> selectOrderByIdDesc();
    
    BulletinboardDetailDto selectById(long board_id);
    
    int bulletinboardDeleteById(long board_id);
    
    int bulletinboardUpdateById(BulletinboardUpdateDto dto);
    
    List<BulletinboardListDto> selectWhereTitle(String keyword);
    
    List<BulletinboardListDto> selectWhereContent(String keyword);
    
    List<BulletinboardListDto> selectWhereTitleAndContent(String keywordT, String keywordC);
    
    List<BulletinboardListDto> selectWhereNickname(String keyword);
    
    List<BulletinboardListDto> selectWhereUserId(String keyword);

	int recommendUp(long boardId);

	int recommendDo(long boardId);
	
	int recommendupInsert(RecommendUp recommend);
	
	int recommenddownInsert(RecommendDown recommend);
	
	RecommendUp recommendUpSelect(RecommendUp recommend);
	
	RecommendDown recommendDownSelect(RecommendDown recommend);
	
	int viewsUp(long boardId);

	List<Bulletinboard> selectAnnouncement();
	
	List<Bulletinboard> selectOrderByRecommend();
	
	List<Bulletinboard> selectNicknameOrderByboardId(String nickname);
	
	int imageUpdate(BulletinboardImageUpdateDto dto);
	
	int recommendUpDelete(long boardId);

	int recommendDownDelete(long boardId);
	
}

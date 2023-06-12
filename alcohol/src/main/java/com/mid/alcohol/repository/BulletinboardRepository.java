package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.domain.RecommendDown;
import com.mid.alcohol.domain.RecommendUp;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.dto.BulletinboardUpdateDto;

// bulletinboard-mapper
public interface BulletinboardRepository {
    
    int bulletinboardInsert(BulletinboardCreateDto dto);
    
    List<BulletinboardListDto> selectImageOrderByIdDesc();
    
    List<BulletinboardListDto> selectNotImageOrderByIdDesc();
    
    BulletinboardDetailDto selectById(long board_id);
    
    int bulletinboardDeleteById(long board_id);
    
    int bulletinboardUpdateById(BulletinboardUpdateDto dto);
    
    int bulletinboardUpdateByIdImageNull(BulletinboardUpdateDto dto);
    
    List<BulletinboardListDto> selectWhereTitle(String keyword);

    List<BulletinboardListDto> selectImageWhereTitle(String keyword); // 이미지
    
    List<BulletinboardListDto> selectWhereContent(String keyword);
    
    List<BulletinboardListDto> selectImageWhereContent(String keyword); // 이미지
    
    List<BulletinboardListDto> selectWhereTitleAndContent(String keywordT, String keywordC);
    
    List<BulletinboardListDto> selectImageWhereTitleAndContent(String keywordT, String keywordC); // 이미지
    
    List<BulletinboardListDto> selectWhereNickname(String keyword);
    
    List<BulletinboardListDto> selectImageWhereNickname(String keyword); // 이미지

    List<BulletinboardListDto> selectWhereUserId(String keyword);
    
    List<BulletinboardListDto> selectImageWhereUserId(String keyword); // 이미지

	int recommendUp(long boardId);

	int recommendDo(long boardId);
	
	int commendupInsert(long boardId, String recommenderId);
	
	int commenddownInsert(long boardId, String recommenderId);
	
	RecommendUp recommendUpSelect(long boardId, String recommenderId);
	
	RecommendDown recommendDownSelect(long boardId, String recommenderId);
	
	int viewsUp(long boardId);

	List<Bulletinboard> selectAnnouncement();
	
	List<Bulletinboard> selectOrderByRecommend();
	
}

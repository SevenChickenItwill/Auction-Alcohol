package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardListDto;

// bulletinboard-mapper
public interface BulletinboardRepository {
    
    int bulletinboardInsert(BulletinboardCreateDto dto);
    
    List<Bulletinboard> selectAllOrderByIdDesc();
    
    BulletinboardDetailDto selectById(long board_id);
    
    int bulletinboardDeleteById(long board_id);
    
    int bulletinboardUpdateById(Bulletinboard bulletnboard);
    
    List<Bulletinboard> selectWhereTitle(String keyword);
    
    List<Bulletinboard> selectWhereContent(String keyword);
    
    List<Bulletinboard> selectWhereTitleAndContent(String keywordT, String keywordC);
    
    List<Bulletinboard> selectWhereNickname(String keyword);

    List<Bulletinboard> selectWhereUserId(String keyword);
}

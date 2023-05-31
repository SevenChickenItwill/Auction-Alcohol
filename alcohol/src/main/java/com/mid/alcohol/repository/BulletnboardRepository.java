package com.mid.alcohol.repository;

import java.util.Collection;
import java.util.List;

import com.mid.alcohol.domain.Bulletnboard;
import com.mid.alcohol.dto.BulletnboardDetailDto;
import com.mid.alcohol.dto.BulletnboardListDto;

// deal-mapper
public interface BulletnboardRepository {
    
    List<BulletnboardListDto> selectWithRecomendCount();
    
    int BulletnboardInsert(BulletnboardDetailDto deal);
    
    List<Bulletnboard> selectAllOrderByIdDesc();
    
    BulletnboardDetailDto selectById(long id);
    
    int bulletnboardUpdateById(Bulletnboard deal);
    
    int bulletnboardDeleteById(long id);

    List<Bulletnboard> selectWhereTitle(String keyword);
    
    List<Bulletnboard> selectWhereContent(String keyword);
    
    List<Bulletnboard> selectWhereTitleAndContent(String keyword);
    
    List<Bulletnboard> selectWhereNickname(String keyword);
    
    List<Bulletnboard> selectWhereUserId(String keyword);

}

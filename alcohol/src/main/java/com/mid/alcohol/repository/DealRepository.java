package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.Deal;
import com.mid.alcohol.dto.DealDetailDto;
import com.mid.alcohol.dto.DealListDto;

// deal-mapper
public interface DealRepository {
    
    List<DealListDto> selectWithReplyCount();
    
    int dealInsert(Deal deal);
    
    List<Deal> selectAllOrderByIdDesc();
    
    DealDetailDto selectById(long id);
    
    int dealUpdateById(Deal deal);
    
    int deleteDealById(long id);

}

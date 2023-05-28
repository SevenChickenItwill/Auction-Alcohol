package com.mid.alcohol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Deal;
import com.mid.alcohol.dto.DealCreateDto;
import com.mid.alcohol.dto.DealDetailDto;
import com.mid.alcohol.dto.DealListDto;
import com.mid.alcohol.repository.DealRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class DealService {
    
    private final DealRepository dealRepository;

    public List<DealListDto> selectAll() {
        log.info("selectAll");
        
        List<Deal> list = dealRepository.selectAllOrderByIdDesc();
        
        return list.stream().map(DealListDto::fromEntity).toList();
    }

    public DealDetailDto selectById(long id) {
        log.info("selectById(id={})", id);
        
        return dealRepository.selectById(id);
    }

    public int readByIdUpdate(Deal deal) {
        log.info("readByIdUpdate()");
        
        return dealRepository.dealUpdateById(deal);
    }

    public int dealDelete(long id) {
        log.info("dealDelete(id= {})", id);
        
        return dealRepository.deleteDealById(id);
    }

    public int create(DealCreateDto dto) {
        log.info("creat(dto= {})", dto);
        
        
        return dealRepository.dealInsert(dto);
    }
    
    
    
}

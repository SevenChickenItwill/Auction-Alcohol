package com.mid.alcohol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Bulletnboard;
import com.mid.alcohol.dto.BulletnboardDetailDto;
import com.mid.alcohol.dto.BulletnboardListDto;
import com.mid.alcohol.repository.BulletnboardRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BulletnboardService {
    
    private final BulletnboardRepository dealRepository;

    public List<BulletnboardListDto> selectAll() {
        log.info("selectAll");
        
        List<Bulletnboard> list = dealRepository.selectAllOrderByIdDesc();
        
        return list.stream().map(BulletnboardListDto::fromEntity).toList();
    }

    public BulletnboardDetailDto selectById(long id) {
        log.info("selectById(id={})", id);
        
        return dealRepository.selectById(id);
    }

    public int readByIdUpdate(Bulletnboard bulletnboard) {
        log.info("readByIdUpdate()");
        
        return dealRepository.bulletnboardUpdateById(bulletnboard);
    }

    public int dealDelete(long id) {
        log.info("dealDelete(id= {})", id);
        
        return dealRepository.bulletnboardDeleteById(id);
    }

    public int create(BulletnboardDetailDto dto) {
        log.info("creat(dto= {})", dto);
        
        
        return dealRepository.BulletnboardInsert(dto);
    }

    public List<BulletnboardListDto> search(String category, String keyword) {
        log.info("searech(category= {}, keyword= {})", category, keyword);
        
        if (category.equals("t")) {
            return dealRepository.selectWhereTitle(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
        } else if (category.equals("c")) {
            return dealRepository.selectWhereContent(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
        } else if (category.equals("tc")) {
            return dealRepository.selectWhereTitleAndContent(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
        } else if (category.equals("n")) {
            return dealRepository.selectWhereNickname(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
        } else if (category.equals("i")) {
            return dealRepository.selectWhereUserId(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
        }
        
        return null;
    }
    
    
    
}

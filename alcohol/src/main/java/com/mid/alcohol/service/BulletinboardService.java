package com.mid.alcohol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.dto.BulletinboardCreateDto;
import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.BulletinboardListDto;
import com.mid.alcohol.repository.BulletinboardRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BulletinboardService {
    
    private final BulletinboardRepository bulletinboardRepository;

    public List<BulletinboardListDto> selectAll() {
        log.info("selectAll");
        
        List<Bulletinboard> list = bulletinboardRepository.selectAllOrderByIdDesc();
        
        return list.stream().map(BulletinboardListDto::fromEntity).toList();
    }

    public BulletinboardDetailDto selectById(long id) {
        log.info("selectById(id={})", id);
        
        return bulletinboardRepository.selectById(id);
    }

//    public int readByIdUpdate(Bulletnboard bulletnboard) {
//        log.info("readByIdUpdate()");
//        
//        return dealRepository.bulletnboardUpdateById(bulletnboard);
//    }
//
//    public int dealDelete(long id) {
//        log.info("dealDelete(id= {})", id);
//        
//        return dealRepository.bulletnboardDeleteById(id);
//    }

    public int create(BulletinboardCreateDto dto) {
        log.info("creat(dto= {})", dto);
        
        
        return bulletinboardRepository.bulletinboardInsert(dto);
    }

//    public List<BulletnboardListDto> search(String category, String keyword) {
//        log.info("searech(category= {}, keyword= {})", category, keyword);
//        
//        if (category.equals("t")) {
//            return dealRepository.selectWhereTitle(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
//        } else if (category.equals("c")) {
//            return dealRepository.selectWhereContent(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
//        } else if (category.equals("tc")) {
//            return dealRepository.selectWhereTitleAndContent(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
//        } else if (category.equals("n")) {
//            return dealRepository.selectWhereNickname(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
//        } else if (category.equals("i")) {
//            return dealRepository.selectWhereUserId(keyword).stream().map(BulletnboardListDto::fromEntity).toList();
//        }
//        
//        return null;
//    }
    
    
    
}
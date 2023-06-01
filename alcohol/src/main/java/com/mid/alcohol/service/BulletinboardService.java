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

    public int readByIdUpdate(Bulletinboard bulletnboard) {
        log.info("readByIdUpdate()");
        
        return bulletinboardRepository.bulletinboardUpdateById(bulletnboard);
    }

    public int bulletinboardDelete(long board_id) {
        log.info("dealDelete(id= {})", board_id);
        
        return bulletinboardRepository.bulletinboardDeleteById(board_id);
    }

    public int create(BulletinboardCreateDto dto) {
        log.info("creat(dto= {})", dto);
        
        
        return bulletinboardRepository.bulletinboardInsert(dto);
    }

    public List<BulletinboardListDto> search(String category, String keyword) {
        log.info("searech(category= {}, keyword= {})", category, keyword);
        
        if (category.equals("t")) {
            return bulletinboardRepository.selectWhereTitle(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("c")) {
            return bulletinboardRepository.selectWhereContent(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("tc")) {
            String keywordT = keyword;
            String keywordC = keywordT;
            return bulletinboardRepository.selectWhereTitleAndContent(keywordT, keywordC).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("n")) {
            return bulletinboardRepository.selectWhereNickname(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        } else if (category.equals("i")) {
            return bulletinboardRepository.selectWhereUserId(keyword).stream().map(BulletinboardListDto::fromEntity).toList();
        }
        
        return null;
    }
    
    
    
}

package com.mid.alcohol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.DealReply;
import com.mid.alcohol.dto.CommentCreateDto;
import com.mid.alcohol.dto.CommentReadDto;
import com.mid.alcohol.dto.CommentUpdateDto;
import com.mid.alcohol.repository.CommentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentService {
    
    private final CommentRepository commentRepository;
        
    public int create(CommentCreateDto dto) {
        log.info("create(dto={})", dto);
        
        return commentRepository.insert(dto.toEntity());
    }

    public List<CommentReadDto> read(long dealId) {
        log.info("read(dealId={})", dealId);
        
        List<DealReply> list = commentRepository.selectByDealId(dealId);
    
        return list.stream().map(CommentReadDto::fromEntity).toList();
    }

    public int update(long id, CommentUpdateDto dto) {
        log.info("update={}", dto);
        
        DealReply entity = DealReply.builder()
                .id(id)
                .content(dto.getContent())
                .build();
        log.info("entity={}", entity);
        
        return commentRepository.update(entity);
    }
    
    
}

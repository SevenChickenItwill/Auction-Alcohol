package com.mid.alcohol.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Comment;
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

    public List<CommentReadDto> read(long boardId) {
        log.info("read(boardId={})", boardId);
        
        List<Comment> list = commentRepository.selectByBoardId(boardId);
    
        return list.stream().map(CommentReadDto::fromEntity).toList();
    }

    public int update(long commentId, CommentUpdateDto dto) {
        log.info("update={}", dto);
        
        Comment entity = Comment.builder()
                .commentId(commentId)
                .content(dto.getContent())
                .build();
        log.info("entity={}", entity);
        
        return commentRepository.update(entity);
    }
    
    public int delete(long commentId) {
        log.info("delete(id={})", commentId);
        
        return commentRepository.delete(commentId);
    }


    
    
}

package com.mid.alcohol.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mid.alcohol.domain.Comment;
import com.mid.alcohol.dto.CommentCreateDto;
import com.mid.alcohol.dto.CommentListDto;
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

    
    // 게시글 고유 번호로 댓글을 찾아 list에 저장, 댓글 읽어오기
    public List<CommentListDto> read(long boardId) {
        log.info("read(boardId={})", boardId);
        
        List<Comment> list = commentRepository.selectByBoardId(boardId);
        List<CommentListDto> list2 = new ArrayList<>();
        for(Comment x : list) {
        	
        	list2.add(CommentListDto.fromEntity(x));
        	
        }
        
        return list2;
    }

    public int update(long commentId, CommentUpdateDto dto) {
        log.info("update(commentId={}, dto={})", commentId, dto);
        
        Comment entity = Comment.builder()
                .comment_id(commentId)
                .content(dto.getContent())
                .build();
        log.info("entity={}", entity);
        
        return commentRepository.update(entity);
    }
    
    public int delete(long commentId) {
        log.info("delete(id={})", commentId);
        
        return commentRepository.delete(commentId);
    }


	public CommentReadDto readByCommentId(long commentId) {
		log.info("delete(id={})", commentId);
		
		Comment entity = commentRepository.selectByCommentId(commentId);
		
		return CommentReadDto.fromEntity(entity);
	}


    
    
}

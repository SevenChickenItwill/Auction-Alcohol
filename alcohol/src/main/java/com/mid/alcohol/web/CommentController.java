package com.mid.alcohol.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.alcohol.dto.BulletinboardDetailDto;
import com.mid.alcohol.dto.CommentCreateDto;
import com.mid.alcohol.dto.CommentReadDto;
import com.mid.alcohol.dto.CommentUpdateDto;
import com.mid.alcohol.service.BulletinboardService;
import com.mid.alcohol.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/bulletinboard/comment")
@Controller
public class CommentController {

    private final CommentService commentService;
    private final BulletinboardService bulletinboardService;
    
    
    @GetMapping("/templist")
    public void templist() {
        
    }
    
    
    @PostMapping
    public ResponseEntity<Integer> createComment(@RequestBody CommentCreateDto dto) {
        log.info("CommentCreateDto(dto={}", dto);
        
        int result = commentService.create(dto);
        
        
        return ResponseEntity.ok(result);
        
    }
    
    
    @GetMapping("/comment-list")
    public ResponseEntity<List<CommentReadDto>> read(@RequestParam("boardId") long boardId) {
        log.info("read(dealId={})", boardId);
        
        List<CommentReadDto> list = commentService.read(boardId);
        log.info("# of comment= {}", list.size());
        
        // 리턴 값이 없는 경우 뷰의 이름은 요청 주소와 같음.
        // /WEB-INF/views/bulletinboard/comment/commentlist.jsp
        
        return ResponseEntity.ok(list);
    }
    
    @PutMapping("/{commentId}")
    public ResponseEntity<Integer> updateReply(
            @PathVariable long commentId,
            @RequestBody CommentUpdateDto dto) {
        log.info("updateComment(id={}, dto={})", commentId, dto);
        
        int result = commentService.update(commentId, dto);
        
        return ResponseEntity.ok(result);
    }
    
    @DeleteMapping("/{commentId}")
    public ResponseEntity<Integer> deleteComment(@PathVariable long commentId) {
        log.info("deleteComment={}", commentId);
        
        int result = commentService.delete(commentId);
        
        
        return ResponseEntity.ok(result);
    }
}
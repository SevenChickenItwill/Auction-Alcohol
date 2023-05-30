package com.mid.alcohol.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mid.alcohol.dto.CommentCreateDto;
import com.mid.alcohol.dto.CommentReadDto;
import com.mid.alcohol.dto.CommentUpdateDto;
import com.mid.alcohol.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/comment")
@Controller
public class CommentController {

    private final CommentService commentService;
    
    @PostMapping
    public ResponseEntity<Integer> createComment(@RequestBody CommentCreateDto dto) {
        log.info("createComment(dto={}", dto);
        
        int result = commentService.create(dto);
        
        
        return ResponseEntity.ok(result);
        
    }
    
    @GetMapping("/all/{dealId}")
    public ResponseEntity<List<CommentReadDto>> read(@PathVariable long dealId) {
        log.info("read(dealId={})", dealId);
        
        List<CommentReadDto> list = commentService.read(dealId);
        log.info("# of comment= {}", list.size());
        
        return ResponseEntity.ok(list);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Integer> updateReply(
            @PathVariable long id,
            @RequestBody CommentUpdateDto dto) {
        log.info("updateComment(id={}, dto={})", id, dto);
        
        int result = commentService.update(id, dto);
        
        return ResponseEntity.ok(result);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Integer> deleteComment(@PathVariable long id) {
        log.info("deleteComment={}", id);
        
        int result = commentService.delete(id);
        
        
        return ResponseEntity.ok(result);
    }
}
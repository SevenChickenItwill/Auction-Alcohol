package com.mid.alcohol.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Comment {
    
    private long comment_id; // 댓글 고유 아이디
    private long board_id; // 댓글 달린 게시글 번호
    private String nickname; // 댓글 유저 닉네임
    private String content; // 댓글 내용
    private LocalDateTime time; // 작성&수정시간
    
}
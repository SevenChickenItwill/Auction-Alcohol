package com.mid.alcohol.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DealReply {
    
    private long id; // 댓글 고유 아이디
    private String dealId; // 댓글 단 포스트 아이디
    private String userNickname; // 댓글 유저 닉네임
    private String userId; // 댓글 유저 아이디
    private long userRanking; // 유저 랭킹
    private String content; // 댓글 내용
    private LocalDateTime time; // 댓글 시간
    
}

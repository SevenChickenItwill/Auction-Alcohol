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
public class Deal {
    
    private long id; // 고유 아이디
    private String title; // 거래 포스트 제목
    private String content; // 거래 포스트 내용
    private String nickname; // 유저 닉네임
    private String user_id; // 유저 아이디
    private long user_ranking; // 유저 랭킹
    private LocalDateTime created_time; // 최초 작성 시간
    private LocalDateTime modified_time; // 수정 시간
    
    
    
}

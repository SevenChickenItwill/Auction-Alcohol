package com.mid.alcohol.dto;

import java.sql.Timestamp;

import com.mid.alcohol.domain.Deal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class DealDetailDto {
    
    private long id; // 글 고유 번호
    private String title; // 글 제목
    private String content; // 글 내용
    private String nickname; // 글 작성자 닉네임
    private String user_id; // 글 작성자 아이디
    private long user_ranking; // 글 작성자 랭킹
    private Timestamp created_time; // 글 작성시간
    private Timestamp modified_time; // 글 수정시간
    
    public static DealDetailDto fromEntity(Deal deal) {
        return DealDetailDto.builder()
                .id(deal.getId())
                .title(deal.getTitle())
                .content(deal.getContent())
                .nickname(deal.getNickname())
                .user_id(deal.getUser_id())
                .user_ranking(deal.getUser_ranking())
                .created_time(Timestamp.valueOf(deal.getCreated_time()))
                .modified_time(Timestamp.valueOf(deal.getModified_time()))
                .build();
    }
    
}

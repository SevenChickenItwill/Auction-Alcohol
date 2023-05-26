package com.mid.alcohol.dto;

import java.sql.Timestamp;

import com.mid.alcohol.domain.Deal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DealListDto {
    
    private long id; // 글 고유 번호
    private String title; // 글 제목
    private String content; // 글 내용
    private String nickname; // 글 작성자 닉네임
    private String user_id; // 글 작성자 아이디
    private long user_ranking; // 글 작성자 랭킹
    private Timestamp modified_time; // 글 수정시간
    private long rcnt; // 댓글 개수 저장 변수
    
    public static DealListDto fromEntity(Deal entity) {
        
        return DealListDto.builder()
                .id(entity.getId())
                .title(entity.getTitle())
                .nickname(entity.getNickname())
                .user_id(entity.getUser_id())
                .user_ranking(entity.getUser_ranking())
                .modified_time(Timestamp.valueOf(entity.getModified_time()))
                .build();
    }
    
}

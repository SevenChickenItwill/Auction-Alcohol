package com.mid.alcohol.dto;

import java.sql.Timestamp;

import com.mid.alcohol.domain.DealReply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
@Builder
public class CommentReadDto {
    
    private long id;
    private String dealId;
    private String userNickname;
    private String userId;
    private long userRanking;
    private String content;
    private Timestamp time;
    
    public static CommentReadDto fromEntity(DealReply entity) {
        
        return CommentReadDto.builder()
                .id(entity.getId())
                .dealId(entity.getDealId())
                .userNickname(entity.getUserNickname())
                .userId(entity.getUserId())
                .userRanking(entity.getUserRanking())
                .content(entity.getContent())
                .time(Timestamp.valueOf(entity.getTime()))
                .build();
    }
        
    
}

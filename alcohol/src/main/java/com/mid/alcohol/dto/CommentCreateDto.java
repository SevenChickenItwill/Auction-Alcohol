package com.mid.alcohol.dto;

import com.mid.alcohol.domain.DealReply;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommentCreateDto {
    
    private String dealId;
    private String userNickname;
    private String userId;
    private long userRanking;
    private String content;
    
    public DealReply toEntity() {
        return DealReply.builder()
                .dealId(dealId)
                .userNickname(userNickname)
                .userId(userId)
                .userRanking(userRanking)
                .content(content)
                .build();
    }
    
}
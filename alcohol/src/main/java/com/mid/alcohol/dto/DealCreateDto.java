package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Deal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DealCreateDto {
    
    private String title;
    private String content;
    private String nickname;
    private String user_id;
    private long user_ranking;
    
    public Deal entity() {
        
        return Deal.builder()
                .title(title)
                .content(content)
                .nickname(nickname)
                .user_id(user_id)
                .user_ranking(user_ranking)
                .build();
    }
    
}

package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Bulletinboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BulletinboardCreateDto {
    
    private int category;
    private String nickname;
    private String user_id;
    private String title;
    private String image;
    private String content;
    
    public Bulletinboard entity(Bulletinboard bulletinboard) {
        return bulletinboard.builder()
                .category(category)
                .title(title)
                .image(image)
                .nickname(nickname)
                .user_id(user_id)
                .content(content)
                .build();
    }
    
}

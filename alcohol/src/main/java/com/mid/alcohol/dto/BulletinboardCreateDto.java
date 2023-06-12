package com.mid.alcohol.dto;

import java.sql.Blob;

import org.springframework.web.multipart.MultipartFile;

import com.mid.alcohol.domain.Bulletinboard;
import com.mid.alcohol.service.BulletinboardService;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class BulletinboardCreateDto {
    
    private int category;
    private String nickname;
    private String user_id;
    private String title;
    private String image;
    private String content;
    
    public Bulletinboard toEntity(Bulletinboard bulletinboard) throws Exception {
        return bulletinboard.builder()
                .category(category)
                .title(title)
                .nickname(nickname)
                .user_id(user_id)
                .image(image)
                .content(content)
                .build();
    }
    
}

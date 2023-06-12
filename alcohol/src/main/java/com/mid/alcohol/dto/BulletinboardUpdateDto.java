package com.mid.alcohol.dto;

import java.sql.Timestamp;

import com.mid.alcohol.domain.Bulletinboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BulletinboardUpdateDto {
    
    private long board_id; // 고유 게시글 번호
    private String title; // 게시글 제목
    private String image; // 게시글 이미지
    private String content; // 게시글 내용
    
    public static BulletinboardUpdateDto fromEntity(Bulletinboard entity) {
        
        return BulletinboardUpdateDto.builder()
                .board_id(entity.getBoard_id())
                .title(entity.getTitle())
                .image(entity.getImage())
                .content(entity.getContent())
                .build();
    }
    
}
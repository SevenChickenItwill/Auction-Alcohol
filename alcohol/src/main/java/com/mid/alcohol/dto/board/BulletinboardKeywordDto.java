package com.mid.alcohol.dto.board;

import java.sql.Timestamp;

import com.mid.alcohol.domain.board.Bulletinboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BulletinboardKeywordDto {
    
	private String title; // 게시글 제목
    private String content; // 게시글 내용
    
    public static BulletinboardKeywordDto fromEntity(Bulletinboard entity) {
        
        return BulletinboardKeywordDto.builder()
                .title(entity.getTitle())
                .content(entity.getContent())
                .build();
    }
    
}
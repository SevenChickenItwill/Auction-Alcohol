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
public class BulletinboardImageUpdateDto {
    
    private long boardId; // 고유 게시글 번호
    private String image; // 게시글 이미지
    
    public static BulletinboardImageUpdateDto fromEntity(Bulletinboard entity) {
        
        return BulletinboardImageUpdateDto.builder()
                .boardId(entity.getBoard_id())
                .image(entity.getImage())
                .build();
    }
    
}

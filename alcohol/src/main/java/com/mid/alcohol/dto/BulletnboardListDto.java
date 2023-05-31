package com.mid.alcohol.dto;

import java.sql.Timestamp;

import com.mid.alcohol.domain.Bulletnboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BulletnboardListDto {
    
    private long board_id; // 고유 게시글 번호
    private int category; // 게시글 종류 ( 1 -> 일반글작성, 0 -> 공지사항 작성)
    private String title; // 게시글 제목
    private String image; // 게시글 이미지
    private String nickname; // 게시글 작성자 닉네임
    private String user_id; // 게시글 작성자 아이디
    private Timestamp time; // 게시글 작성 & 수정 시간
    private long views; // 게시글 조회수
    private long recommend; // 게시글 추천수
    private long rcnt; // 게시글 댓글수
    
    public static BulletnboardListDto fromEntity(Bulletnboard entity) {
        
        return BulletnboardListDto.builder()
                .board_id(entity.getBoard_id())
                .category(entity.getCategory())
                .title(entity.getTitle())
                .image(entity.getImage())
                .nickname(entity.getNickname())
                .user_id(entity.getUser_id())
                .time(Timestamp.valueOf(entity.getTime()))
                .views(entity.getViews())
                .recommend(entity.getRecommend())
                .build();
    }
    
}

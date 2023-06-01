package com.mid.alcohol.dto;

import java.sql.Timestamp;

import com.mid.alcohol.domain.Bulletinboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BulletinboardDetailDto {
    
    private long board_id; // 게시글 고유 번호
    private String image; // 게시글 이미지
    private String title; // 게시글 제목
    private String nickname; // 게시글 작성자 닉네임
    private String user_id; // 게시글 작성자 아이디
    private Timestamp time; // 게시글 작성 & 수정 시간
    private long views; // 게시글 조회수
    private long recommend; // 게시글 추천수
    private String content; // 게시글 내용
    
    public static BulletinboardDetailDto fromEntity(Bulletinboard entity) {
        return BulletinboardDetailDto.builder()
                .board_id(entity.getBoard_id())
                .image(entity.getImage())
                .title(entity.getTitle())
                .nickname(entity.getNickname())
                .user_id(entity.getUser_id())
                .time(Timestamp.valueOf(entity.getTime()))
                .views(entity.getViews())
                .recommend(entity.getRecommend())
                .content(entity.getContent())
                .build();
    }
    
}
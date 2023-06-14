package com.mid.alcohol.domain.board;

import java.sql.Blob;
import java.time.LocalDateTime;

import jakarta.servlet.http.Part;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Bulletinboard {
    
    private long board_id; // 고유 게시글 아이디
    private String title; // 게시글 제목
    private String nickname; // 게시글 작성자 닉네임
    private String user_id; // 게시글 작성자 아이디
    private LocalDateTime time; // 게시글 작성 & 수정 시간
    private long views; // 게시글 조회수
    private long recommend; // 게시글 추천수
    private String content; // 게시글 내용
    private String image; // 게시글 이미지
    private int category; // 게시글 종류 ( 1 -> 일반글작성, 0 -> 공지사항글 작성)
    
    
}
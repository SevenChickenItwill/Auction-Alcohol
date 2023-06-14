package com.mid.alcohol.dto.board;

import com.mid.alcohol.domain.board.Comment;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommentCreateDto {
    
    private long boardId; // 댓글 게시판 고유 아이디
    private String nickname; // 댓글 작성자 닉넴
    private String content; // 댓글 내용
    
    
    public Comment toEntity() {
        return Comment.builder()
                .board_id(boardId)
                .nickname(nickname)
                .content(content)
                .build();
    }
    
}

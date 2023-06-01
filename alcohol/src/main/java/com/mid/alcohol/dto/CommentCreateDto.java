package com.mid.alcohol.dto;

import com.mid.alcohol.domain.Comment;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommentCreateDto {
    
    private long boardId;
    private String nickname;
    private String content;
    
    
    public Comment toEntity() {
        return Comment.builder()
                .boardId(boardId)
                .nickname(nickname)
                .content(content)
                .build();
    }
    
}

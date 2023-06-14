package com.mid.alcohol.dto.board;

import java.sql.Timestamp;

import com.mid.alcohol.domain.board.Comment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
@Builder
public class CommentReadDto {
    
    private long commentId;
    private long boardId;
    private String nickname;
    private String content;
    private Timestamp time;
    
    public static CommentReadDto fromEntity(Comment entity) {
        
        return CommentReadDto.builder()
                .commentId(entity.getComment_id())
                .boardId(entity.getBoard_id())
                .nickname(entity.getNickname())
                .content(entity.getContent())
                .time(Timestamp.valueOf(entity.getTime()))
                .build();
                
                
    }
        
    
}

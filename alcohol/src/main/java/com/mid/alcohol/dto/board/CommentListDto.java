package com.mid.alcohol.dto.board;



import java.sql.Timestamp;

import com.mid.alcohol.domain.board.Comment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentListDto {

	private String nickname;
	private Timestamp time;
	private String content;
	private long commentId;
	private long boardId;
	
	private long rcnt; // 댓글 개수
	
	public static CommentListDto fromEntity(Comment entity) {
		return CommentListDto.builder()
				.nickname(entity.getNickname())
				.time(Timestamp.valueOf(entity.getTime()))
				.content(entity.getContent())
				.commentId(entity.getComment_id())
				.boardId(entity.getBoard_id())
					.build();
	}
	
}
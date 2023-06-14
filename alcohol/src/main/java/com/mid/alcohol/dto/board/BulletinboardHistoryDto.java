package com.mid.alcohol.dto.board;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.mid.alcohol.domain.board.Bulletinboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BulletinboardHistoryDto {
	private String user_id;
	private String nickname;
	private long board_id;
	private String title;
	private String content;
	private Timestamp time;
	
	
	public static BulletinboardHistoryDto fromEntity(Bulletinboard entity) {
		
		return BulletinboardHistoryDto.builder()
				.user_id(entity.getUser_id())
				.nickname(entity.getNickname())
				.board_id(entity.getBoard_id())
				.title(entity.getTitle())
				.content(entity.getContent())
				.time(Timestamp.valueOf(entity.getTime()))
				.build();
				
	}
}

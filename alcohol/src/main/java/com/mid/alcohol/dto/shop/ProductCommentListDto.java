package com.mid.alcohol.dto.shop;

import java.sql.Timestamp;

import com.mid.alcohol.domain.shop.ProductComment;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductCommentListDto {
	private String nickname;
	private Timestamp time;
	private String content;
	private long commentId;
	private long pId;
	private String pName;
	
	private long rcnt;// 댓글세기
	
	public static ProductCommentListDto fromEntity(ProductComment entity) {
		return ProductCommentListDto.builder()
				.nickname(entity.getNickname())
				.time(Timestamp.valueOf(entity.getTime()))
				.content(entity.getContent())
				.commentId(entity.getCommentId())
				.pId(entity.getPid())
				.pName(entity.getPname())
				.build();
	}
}

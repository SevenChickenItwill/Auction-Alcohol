package com.mid.alcohol.dto.shop;

import java.sql.Timestamp;

import com.mid.alcohol.domain.shop.ProductComment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@AllArgsConstructor
@Builder
public class ProductCommentReadDto {
	
	private long commentId;
    private long pId;
    private String nickname;
    private String content;
    private Timestamp time;
    
    public static ProductCommentReadDto fromEntity(ProductComment entity) {
    	
    	return ProductCommentReadDto.builder()
    			.commentId(entity.getCommentId())
    			.pId(entity.getCommentId())
    			.nickname(entity.getNickname())
                .content(entity.getContent())
                .time(Timestamp.valueOf(entity.getTime()))
                .build();
    }
}

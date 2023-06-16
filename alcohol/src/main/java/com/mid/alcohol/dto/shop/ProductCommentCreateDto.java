package com.mid.alcohol.dto.shop;


import com.mid.alcohol.domain.shop.ProductComment;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProductCommentCreateDto {


	private long pid;
	private String pname;
	private String nickname;
	private String content;

	
	public ProductComment toEntity() {
		
		return ProductComment.builder()
				.pid(pid)
				.pname(pname)
				.nickname(nickname)
				.content(content)
				.build();
				
				
	}
	
}

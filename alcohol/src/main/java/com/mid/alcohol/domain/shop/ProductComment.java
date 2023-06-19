package com.mid.alcohol.domain.shop;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductComment {

	private long commentId;
	private long pid;
	private String pname;
	private String nickname;
	private String content;
	private LocalDateTime time;

}

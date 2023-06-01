package com.mid.alcohol.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ChatInputDto {

	private long cid;
	private String userid;
	private String conversation;
	private int texttype;
}

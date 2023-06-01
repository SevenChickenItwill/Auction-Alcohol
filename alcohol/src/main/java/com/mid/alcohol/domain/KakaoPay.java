package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPay {
		private String tid; // 결제 고유 번호
	    private String next_redirect_pc_url; // pc 웹일 경우 받는 결제 페이지
	    private String created_at;

}

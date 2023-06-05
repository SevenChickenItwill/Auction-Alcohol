package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayResponse {
		
	// KakaoPayReadVO
		private String tid; 			// 결제 고유 번호 MAX20
	    private String next_redirect_pc_url; // 요청 클라이언트가 pc 웹일 때 받는 결제 페이지
	    private String created_at;		//	결제 준비 요청 시간
}

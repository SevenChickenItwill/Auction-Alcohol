package com.mid.alcohol.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Login {

	// 로그인 테스트 용 모델, 실제로는 도현이가 만든 모델 사용할 거임.
	private String userEmail;
	private String userPassword;
	private String userNickname;
	
}

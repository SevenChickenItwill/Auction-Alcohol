package com.mid.alcohol.domain;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	private int memberId; // TODO:
	private String userId; // 회원 아이디
    private String memberPassword;	// 회원 비밀번호
    private String memberName; // 회원 이름
    private String memberAge; // 회원 나이
    private String memberGender; // 회원 성별
    private String memberadress; // 회원 주소
    private String memberPhone; // 회원 전화번호
    private String memberEmail; // 회원 이메일
    private Timestamp memberBirthday; // 회원 생년월일
}

package com.mid.alcohol.domain;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class User {
    private String userEmail; // 유저 이메일 (PK)(아이디,회원수를 이메일이 대신한다)
	private String userPassword; // 유저 비밀번호
	private String userPasswordCheck; // 유저 비밀번호 중복체크
	private String userName; // 유저 이름
	private int userAge; // 유저 나이
	private String userAddress; // 유저 주소
	private String userDtailAddress; // 상세주소
    private String userAddressNotes; // 주소 참고사항
	private String userPhone; // 유저 전화번호
	private String userNickname; // 유저 별명
	private LocalDateTime userBirthday; // 유저 생년월일
	private LocalDateTime userJoindate; // 유저 가입 시간
	private String userGender; // 유저 성별
	private Number category; // 판매자&구매자 구별
	private long userRanking; // 유저 등급
	private long userPoint; // 유저가 갖고있는 포인트
}

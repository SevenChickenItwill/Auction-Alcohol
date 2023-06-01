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
public class Member {
    
    private String memberId; // 회원수
    private long userId; // 유저 아이디
    private String memberPassword; // 유저 비밀번호
    private String memberPasswordSame; // 유저 비밀전호 중복체크 
    private String memberName; // 유저 이름
    private long memberAge; // 유저 나이
    private String memberAdress; // 유저 주소
    private String memberPhone; // 유저 전화번호
    private String memberEmail; // 유저 이메일 
    private LocalDateTime memberBirthday; // 유저 생년월일
    private LocalDateTime memberJoindate; // 유저 가입 시간
    private String memberGender; // 유저 성별
    private long memberRanking; // 유저 등급
    private long memberPoint; // 유저가 갖고있는 포인트
}

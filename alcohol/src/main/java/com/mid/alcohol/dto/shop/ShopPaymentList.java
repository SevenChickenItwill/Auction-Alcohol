package com.mid.alcohol.dto.shop;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShopPaymentList {

	private long pid;
	private String productname;
	private String standard;
	private String unit;
	private long price;
	private String brand;
	private String userid;
	private String expirationdate;
	private double alcohol_level;
	private String hashtag;
	private String photopath;
	private int category;
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
	private int categorys; // 판매자&구매자 구별 나중에 바꿔야 됌
	private long userRanking; // 유저 등급
	private long userPoint; // 유저가 갖고있는 포인트
	private long paymentid;
	private long totalamount;
	private long basketid;
	private int quantity;
	private int status;
	
}

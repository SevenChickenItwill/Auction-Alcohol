package com.mid.alcohol.domain;
import java.sql.Timestamp;
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
public class Payment {
	private int memberId;
	private String userId;
    private String memberPassword;
    private String memberName;
    private String memberAge;
    private String memberGender;
    private String memberadress;
    private String memberPhone;
    private String memberEmail;
    private Timestamp memberBirthday;

}

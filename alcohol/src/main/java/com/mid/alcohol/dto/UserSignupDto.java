package com.mid.alcohol.dto;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import com.mid.alcohol.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class UserSignupDto {
    
    private String userEmail;
    private String userPassword;
    private String userPasswordCheck;
    private String userName;
    private int userAge;
    private String userAddress;
    private String userDtailAddress;
    private String userAddressNotes;
    private String userPhone;  
    private String userGender;
    private String userNickname;
    private Number category; 
    private LocalDate userBirthday;
    private Timestamp userJoindate = Timestamp.valueOf(LocalDateTime.now());
    // -> JSPL에서는 LocalDateTime 겍체를 사용하지 못하기 때문에 Timestamp 타입으로 선언
    
    
    
    
    public User toEntity() {
        
        int currentYear = LocalDate.now().getYear();
        int userBirthYear = userBirthday.getYear();
        int userAge = currentYear - userBirthYear + 1;
        
        return User.builder()
                .userPassword(userPassword)
                .userPasswordCheck(userPasswordCheck)
                .userName(userName)
                .userAddress(userAddress)
                .userDtailAddress(userDtailAddress)
                .userAddressNotes(userAddressNotes)
                .userPhone(userPhone)
                .userGender(userGender)
                .userEmail(userEmail)
                .userAge(userAge)
                .userNickname(userNickname)
                .category(category)
                .userBirthday(LocalDateTime.of(userBirthday, LocalTime.of(0, 0)))
                .userJoindate(userJoindate.toLocalDateTime())
                .build();
                
                
    }
    
}


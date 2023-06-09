package com.mid.alcohol.dto;

import java.time.LocalDate;

import com.mid.alcohol.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class UserModifyDto {
    
    private String userEmail;
    private String userPassword;
    private String userPhone;
    private LocalDate userBirthday;
    
    public static UserModifyDto fromEntity(User entity) {
        return UserModifyDto.builder()
                .userEmail(entity.getUserEmail())
                .userPassword(entity.getUserPassword())
                .userPhone(entity.getUserPhone())
                .userBirthday(LocalDate.of(entity.getUserBirthday().getYear(),
                        entity.getUserBirthday().getMonthValue(),
                        entity.getUserBirthday().getDayOfMonth()))
                .build();
    }
    
}

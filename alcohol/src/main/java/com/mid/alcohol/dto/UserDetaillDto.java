package com.mid.alcohol.dto;

import java.time.LocalDate;

import com.mid.alcohol.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class UserDetaillDto {
    
    private String userEmail;
    private String userPassword;
    private String userPhone;
    private String userAddress;
    private LocalDate userBirthday;
    
    public static UserDetaillDto fromEntity(User entity) {
        return UserDetaillDto.builder()
                .userEmail(entity.getUserEmail())
                .userPassword(entity.getUserPassword())
                .userPhone(entity.getUserPhone())
                .userAddress(entity.getUserAddress())
                .userBirthday(LocalDate.of(entity.getUserBirthday().getYear(),
                        entity.getUserBirthday().getMonthValue(),
                        entity.getUserBirthday().getDayOfMonth()))
                .build();
    }
    
}

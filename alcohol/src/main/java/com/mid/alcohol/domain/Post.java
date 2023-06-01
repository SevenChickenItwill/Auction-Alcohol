package com.mid.alcohol.domain;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본 생성자 만들어줌
@AllArgsConstructor // 올 아그스 : 초기화된 생성자 만들어줌
@Builder
@Getter
@Setter
@ToString
public class Post {
    
    // DB의 데이터를 가지고 있는 클래스

    private String id;
    private String password;
    private long ranking;
    private String name;
    private String birth;  
    private long age;
    private String email;
    private String phone;
    
}

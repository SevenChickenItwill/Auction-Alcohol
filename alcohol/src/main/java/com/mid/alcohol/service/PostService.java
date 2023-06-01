package com.mid.alcohol.service;

import org.springframework.stereotype.Service;

import com.mid.alcohol.repository.PostRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

 
@Service //-> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리.(필요한 곳에 주입)
@Slf4j
@RequiredArgsConstructor
public class PostService {
    
    
    // 서비스는 리파지토리 객체가 필요한데 스프링에서 의존성 주입에 의해서 객체가 자동 생성?
    //private final PostRepository postRepository;
    
    
    
    
}
